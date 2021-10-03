resource "aws_security_group" "sg" {
  name        = var.group_name
  description = "${var.core_info.input_vars.app_name} ${var.group_name}"
  vpc_id      = var.core_info.vpc_id

  tags = var.core_info.required_tags
}

resource "aws_security_group_rule" "ingress_from_self" {
  count             = (var.ingress_self ? 1 : 0)
  description       = "ingress from self"
  type              = "ingress"
  from_port         = "27017"
  to_port           = "27017"
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "ingress_rules" {
  count = length(var.ingress_rules)

  description              = var.ingress_rules[count.index].description
  type                     = "ingress"
  security_group_id        = aws_security_group.sg.id
  from_port                = var.ingress_rules[count.index].from
  to_port                  = var.ingress_rules[count.index].to
  protocol                 = lookup(var.ingress_rules[count.index], "protocol", "tcp")
  source_security_group_id = lookup(var.ingress_rules[count.index], "source_security_group_id", null)
  cidr_blocks              = lookup(var.ingress_rules[count.index], "cidr_blocks", null)
}

resource "aws_security_group_rule" "open_egress" {
  count             = (var.open_egress ? 1 : 0)
  description       = "egress to anywhere"
  type              = "egress"
  from_port         = "0"
  to_port           = "0"
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg.id
}

resource "aws_security_group_rule" "egress_rules" {
  count                    = length(var.egress_rules)
  description              = lookup(var.ingress_rules[count.index], "description", null)
  type                     = "egress"
  security_group_id        = aws_security_group.sg.id
  from_port                = var.ingress_rules[count.index].from
  to_port                  = var.ingress_rules[count.index].to
  protocol                 = lookup(var.ingress_rules[count.index], "protocol", "tcp")
  source_security_group_id = lookup(var.ingress_rules[count.index], "source_security_group_id", null)
  cidr_blocks              = lookup(var.ingress_rules[count.index], "cidr_blocks", null)
}
