<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| bypass\_replication | Whether or not to bypass the Lambda replication for the secret | `bool` | `false` | no |
| core\_info | n/a | `any` | n/a | yes |
| is\_user\_creds | Whether or not secret is for user credentials, requiring password generation | `bool` | `true` | no |
| kms\_key\_id | n/a | `string` | n/a | yes |
| primary\_password | Optional password to use from primary cluster instead of generating new random password | `string` | `""` | no |
| secret\_input | n/a | `map` | n/a | yes |
| secret\_name | n/a | `string` | n/a | yes |
| special | Whether or not special characters should be used when generating secrets manager value : True / False | `string` | `"false"` | no |

## Outputs

| Name | Description |
|------|-------------|
| password | n/a |
| secret\_arn | n/a |
| secret\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->