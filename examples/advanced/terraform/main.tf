module document_db {
  source = "git@github.com:wy-Inc/documentdb-aws-tf-module.git//terraform?ref=1.0"

  account_id                = var.account_id
  app_name                  = var.app_name
  environment               = var.environment
  cost_center               = var.cost_center
  owner_email               = var.owner_email
  data_classification       = var.data_classification
  database_name             = var.database_name
  kms_key_prefix            = var.kms_key_prefix
  db_engine_version         = var.db_engine_version
  global_enabled            = var.global_enabled
  primary_region            = var.primary_region
  primary_instances         = var.primary_instances
  primary_instance_class    = var.primary_instance_class
  secondary1_enabled        = var.secondary1_enabled
  secondary1_region         = var.secondary1_region
  secondary1_instances      = var.secondary1_instances
  secondary1_instance_class = var.secondary1_instance_class
  secondary2_enabled        = var.secondary2_enabled
  secondary2_region         = var.secondary2_region
  secondary2_instances      = var.secondary2_instances
  secondary2_instance_class = var.secondary2_instance_class
}
