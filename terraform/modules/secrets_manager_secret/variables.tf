variable "secret_name" {
  type = string
}
variable "core_info" {
}
variable "secret_input" {
  type = map
}
variable "kms_key_id" {
  type = string
}

variable "primary_password" {
  description = "Optional password to use from primary cluster instead of generating new random password"
  type        = string
  default     = ""
}

variable "special" {
  description = "Whether or not special characters should be used when generating secrets manager value : True / False"
  default     = "false"
}

variable "bypass_replication" {
  description = "Whether or not to bypass the Lambda replication for the secret"
  type        = bool
  default     = false
}

variable "is_user_creds" {
  description = "Whether or not secret is for user credentials, requiring password generation"
  type        = bool
  default     = true
}
