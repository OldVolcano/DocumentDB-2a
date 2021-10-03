################################################################
# password.tf
# Generate a random password for our db user and store it in
# Secrets Manager
################################################################

################################################################
# "Regional" (no Lambda replication) secret for reader endpoint 
################################################################
# This is currently a commented-out placeholder for the future
# when Terraform AWS provider will support global cluster creation
#module "db_reader_endpoint" {
#  source = "../secrets_manager_secret"
#
#  secret_name        = "db_connection_reader_endpoint"
#  kms_key_id         = var.kms_db_key_arn
#  core_info          = module.core_info
#  is_user_creds      = false
#  bypass_replication = true
#
#  secret_input = {
#    reader_endpoint = aws_route53_record.regional_reader_address.fqdn
#  }
#}
