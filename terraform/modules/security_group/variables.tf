variable "ingress_rules" {
  description = "List of ingress rules to create"
  type = list(object({
    from                     = number
    to                       = number
    description              = string
    cidr_blocks              = list(string)
    source_security_group_id = string
  }))
  default = []
}

variable "egress_rules" {
  description = "List of egress rules to create"
  type = list(object({
    from = number
    to   = number
  }))

  default = []
}

variable "group_name" {
  description = "The name of your security group"
}

variable "ingress_self" {
  description = "Whether to allow ingress from within the security group"
  default     = true
}
variable "open_egress" {
  description = "Allow open egress from the security group"
  default     = true
}
variable "core_info" {
}
