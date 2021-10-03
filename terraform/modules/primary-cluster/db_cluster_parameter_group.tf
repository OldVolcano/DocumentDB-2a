################################################################
# db_cluster_parameter_group.tf
# Manage the parameter group attached to our databases
################################################################

resource "aws_docdb_cluster_parameter_group" "docdb_cluster_param_group" {
  name   = "${local.resource_short_name}-docdb-cluster"
  family = "docdb${split(".", var.engine_version)[0]}.${split(".", var.engine_version)[1]}"

  parameter {
    name         = "audit_logs"
    value        = var.audit_logs
    apply_method = "immediate"
  }

  parameter {
    name         = "profiler"
    value        = var.profiler
    apply_method = "immediate"
  }

  tags = module.core_info.required_tags
}
