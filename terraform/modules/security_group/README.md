<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| core\_info | n/a | `any` | n/a | yes |
| egress\_rules | List of egress rules to create | <pre>list(object({<br>    from = number<br>    to   = number<br>  }))</pre> | `[]` | no |
| group\_name | The name of your security group | `any` | n/a | yes |
| ingress\_rules | List of ingress rules to create | <pre>list(object({<br>    from                     = number<br>    to                       = number<br>    description              = string<br>    cidr_blocks              = list(string)<br>    source_security_group_id = string<br>  }))</pre> | `[]` | no |
| ingress\_self | Whether to allow ingress from within the security group | `bool` | `true` | no |
| open\_egress | Allow open egress from the security group | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | Id of the created security group |
| name | Id of the created security group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->