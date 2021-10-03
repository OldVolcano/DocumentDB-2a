################################################################
# password.tf
# Generate a random password for our db user and store it in
# Secrets Manager
################################################################

################################################################
# "Global" secret for writer endpoint 
################################################################
module "db_writer_endpoint" {
  source = "../secrets_manager_secret"

  secret_name   = "db_connection_writer_endpoint"
  kms_key_id    = var.kms_db_key_arn
  core_info     = module.core_info
  is_user_creds = false

  secret_input = {
    writer_endpoint = aws_route53_record.global_writer_address.fqdn
  }
}

################################################################
# "Regional" (no Lambda replication) secret for reader endpoint 
################################################################
module "db_reader_endpoint" {
  source = "../secrets_manager_secret"

  secret_name        = "db_connection_reader_endpoint"
  kms_key_id         = var.kms_db_key_arn
  core_info          = module.core_info
  is_user_creds      = false
  bypass_replication = true

  secret_input = {
    reader_endpoint = aws_route53_record.regional_reader_address.fqdn
  }
}

################################################################
# "Global" secrets for database user credentials
################################################################
module "master_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_master"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = var.username
  }
}

module "dbs_admin_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_dbs_admin"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = "dbs_admin"
  }
}

module "app_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_app"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = "${var.database_name}_app"
  }
}

module "bi_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_bi"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = "${var.database_name}_bi"
  }
}

module "ro_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_ro"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = "${var.database_name}_ro"
  }
}

module "dms_db_password" {
  source = "../secrets_manager_secret"

  secret_name      = "db_connection_info_dms"
  kms_key_id       = var.kms_db_key_arn
  core_info        = module.core_info
  special          = var.special
  primary_password = ""

  secret_input = {
    username = "${var.database_name}_dms"
  }
}
