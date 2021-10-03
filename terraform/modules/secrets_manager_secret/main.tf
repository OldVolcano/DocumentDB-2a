locals {
  resource_name_prefix = "/wy/${var.core_info.input_vars.environment}/${var.core_info.short_region}/${var.core_info.input_vars.app_name}/docdb/${var.secret_name}"
}

resource "random_password" "password" {
  count   = var.is_user_creds ? 1 : 0
  length  = 32
  special = var.special
  # The password for the master database user can be any printable ASCII character except "/", """, or "@".
  # -- https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Limits.html#RDS_Limits.Constraints
  override_special = "!#*_=:"
}

resource "aws_secretsmanager_secret" "secret" {
  name                    = local.resource_name_prefix
  description             = "Connection information for ${var.core_info.input_vars.app_name} ${var.core_info.input_vars.environment} database"
  recovery_window_in_days = 0
  kms_key_id              = var.kms_key_id
  tags                    = var.bypass_replication ? merge(var.core_info.required_tags, { "wy:bypass-replication-tag" = "true" }) : var.core_info.required_tags
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.is_user_creds ? (jsonencode(merge(var.secret_input, { password = var.primary_password == "" ? random_password.password[0].result : var.primary_password }))) : (jsonencode(var.secret_input))
}

output "secret_arn" {
  value = aws_secretsmanager_secret.secret.arn
}

output "secret_name" {
  value = local.resource_name_prefix
}

output "password" {
  value = var.is_user_creds ? random_password.password[0].result : ""
}

