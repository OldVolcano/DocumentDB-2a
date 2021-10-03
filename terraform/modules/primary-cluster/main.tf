#Added this here since this cluster will be in a different region.
module "core_info" {
  source              = "git@github.com:wy-Inc/core-info-aws-tf-module.git//terraform?ref=0.5.72"
  app_name            = var.app_name
  environment         = var.environment
  region              = var.region
  cost_center         = var.cost_center
  owner_email         = var.owner_email
  data_classification = var.data_classification

}

locals {
  db_subnet_group_name = var.db_subnet_group_name == "" ? join("", aws_db_subnet_group.default.*.name) : var.db_subnet_group_name

  docdb_security_group_id = join("", module.security_group.id)

  resource_short_name = "wy-${trimsuffix(module.core_info.resource_name_prefix, "-")}"
  resource_long_name  = "wy-${trimsuffix(module.core_info.resource_name_full_region_prefix, "-")}"

  vpc_id                          = module.core_info.vpc_id
  r53_writer_resource_name_prefix = "${module.core_info.input_vars.environment}-global-${module.core_info.input_vars.app_name}-docdb"
  r53_reader_resource_name_prefix = "${module.core_info.resource_name_prefix}docdb"
}

resource "random_uuid" "last_snap_id" {}

resource "aws_db_subnet_group" "default" {
  count       = var.db_subnet_group_name == "" ? 1 : 0
  name        = "${local.resource_short_name}-docdb"
  description = "For DocumentDB cluster ${local.resource_short_name}"
  subnet_ids  = module.core_info.database_subnets
  tags        = module.core_info.required_tags
}

#################################################################################
# Commented-out placeholder for the future when Terraform AWS provider will 
# support global cluster creation.
#
#resource "aws_docdb_global_cluster" "global_cluster" {
#  count                        = var.global_enabled == true ? 1 : 0
#  global_cluster_identifier    = "${local.resource_short_name}-global"
#  source_db_cluster_identifier = aws_docdb_cluster.primary.arn
#  force_destroy                = true
#
#  lifecycle {
#    ignore_changes = [source_db_cluster_identifier]
#  }
#}

resource "aws_docdb_cluster" "primary" {
  cluster_identifier              = "${local.resource_short_name}-cluster"
  engine                          = "docdb"
  engine_version                  = var.engine_version
  kms_key_id                      = var.kms_db_key_arn
  master_username                 = var.username
  master_password                 = module.master_db_password.password
  final_snapshot_identifier       = "${local.resource_short_name}-finalsnapshot-${random_uuid.last_snap_id.result}"
  skip_final_snapshot             = var.skip_final_snapshot
  deletion_protection             = var.deletion_protection
  backup_retention_period         = var.backup_retention_period
  preferred_backup_window         = var.preferred_backup_window
  preferred_maintenance_window    = var.preferred_maintenance_window
  db_subnet_group_name            = local.db_subnet_group_name
  vpc_security_group_ids          = compact(concat(module.security_group.id, var.vpc_security_group_ids))
  snapshot_identifier             = var.snapshot_identifier
  storage_encrypted               = true
  port                            = 27017
  apply_immediately               = var.apply_immediately
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.docdb_cluster_param_group.name
  enabled_cloudwatch_logs_exports = (var.export_logs ? ["audit", "profiler"] : [])

  timeouts {
    create = "120m"
    delete = "120m"
    update = "120m"
  }
  tags = module.core_info.required_tags
}

#################################################################
# Primary cluster forces 1 instance, because there must be at
# least one for AWS to create the storage volume and compute
# capacity. If you need at least 1 reader instance, you must
# set the number_instances variable to at least 2 as one of 
# the instances must be the writer.
#
resource "aws_docdb_cluster_instance" "primary_instance" {
  count = var.number_instances > 0 ? var.number_instances : 1

  identifier                   = "${local.resource_short_name}-${count.index}"
  cluster_identifier           = aws_docdb_cluster.primary.id
  instance_class               = var.instance_type
  preferred_maintenance_window = var.preferred_maintenance_window
  apply_immediately            = var.apply_immediately
  auto_minor_version_upgrade   = false
  promotion_tier               = count.index

  tags = module.core_info.required_tags

  timeouts {
    create = "120m"
    delete = "120m"
    update = "120m"
  }
}

module "security_group" {
  source    = "../security_group"
  core_info = module.core_info

  group_name = "${local.resource_short_name}-docdb-sg"

  ingress_self = true
  open_egress  = true

  ingress_rules = concat([
    {
      description              = "ingress from sdp",
      from                     = 27017,
      to                       = 27017,
      cidr_blocks              = ["10.112.70.0/23"],
      source_security_group_id = null
    }], [
    for sg in var.ingress_security_groups :
    {
      description              = "ingress from ${sg}",
      from                     = 27017,
      to                       = 27017,
      source_security_group_id = sg,
      cidr_blocks              = null
    }
    ], [
    {
      description              = "ingress from ec2_docdb",
      from                     = 27017,
      to                       = 27017,
      source_security_group_id = null
      cidr_blocks              = ["10.0.0.0/8"]
    }
  ])
}

resource "aws_route53_record" "global_writer_address" {
  zone_id = module.core_info.hosted_zone_id
  name    = "db-writer-${local.r53_writer_resource_name_prefix}"
  type    = "CNAME"
  ttl     = var.ttl
  records = [aws_docdb_cluster.primary.endpoint]
}

resource "aws_route53_record" "regional_reader_address" {
  zone_id = module.core_info.hosted_zone_id
  name    = "db-reader-${local.r53_reader_resource_name_prefix}"
  type    = "CNAME"
  ttl     = var.ttl
  records = [aws_docdb_cluster.primary.reader_endpoint]
}

resource "null_resource" "baseline_config" {
  # This local-exec is being used to perform the baseline configuration in the database instance,
  # applying the standard set of service accounts and access privileges.  It will run on every apply,
  # but the baseline bash and mongo shell script are idempotent and will not cause failures for
  # accounts that already exist.

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "${path.module}/baseline_configuration.sh"

    environment = {
      DBNAME        = var.database_name
      MASTER_USER   = var.username
      DBHOST        = aws_docdb_cluster.primary.endpoint
      DBPASSWORD    = module.master_db_password.password
      DBS_ADMIN_PWD = module.dbs_admin_db_password.password
      APP_PWD       = module.app_db_password.password
      BI_PWD        = module.bi_db_password.password
      RO_PWD        = module.ro_db_password.password
      DMS_PWD       = module.dms_db_password.password
    }
  }

  depends_on = [
    aws_route53_record.global_writer_address,
    aws_docdb_cluster_instance.primary_instance,
  ]
}
