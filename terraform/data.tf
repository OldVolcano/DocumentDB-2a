data "aws_kms_alias" "kms_key_primary" {
  name     = "alias/${var.environment}/${var.primary_region}/${var.kms_key_prefix}-db-key"
  provider = aws.primary
}

data "aws_kms_alias" "kms_key_secondary1" {
  name     = "alias/${var.environment}/${var.secondary1_region}/${var.kms_key_prefix}-db-key"
  provider = aws.secondary1
}

data "aws_kms_alias" "kms_key_secondary2" {
  name     = "alias/${var.environment}/${var.secondary2_region}/${var.kms_key_prefix}-db-key"
  provider = aws.secondary2
}
