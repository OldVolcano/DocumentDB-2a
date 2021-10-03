<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws.primary | n/a |
| aws.secondary1 | n/a |
| aws.secondary2 | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | n/a | `any` | n/a | yes |
| app\_name | The name of the application that this resource belongs to. | `string` | n/a | yes |
| cost\_center | The wy cost center that this resource belongs to, e.g. IT - Supply Chain | `string` | n/a | yes |
| data\_classification | The level of data sensitity of data on or through this resource. pci \| <empty> | `string` | n/a | yes |
| database\_name | Name of database to create | `string` | n/a | yes |
| db\_engine\_version | Version of DocumentDB engine | `string` | `"4.0.0"` | no |
| environment | The wy environment this resource will be deployed in, e.g. dev, prod. | `string` | n/a | yes |
| global\_enabled | Whether or not to enable and create a global, multi-region cluster versus single-region cluster. | `bool` | `true` | no |
| kms\_key\_prefix | The prefix of the hyphen-separated KMS key name for database encryption, e.g. <prefix>-db-key | `string` | n/a | yes |
| owner\_email | A distribution list that contains the owners of this resource. Do not specifiy an individual's email address. | `string` | n/a | yes |
| primary\_instance\_class | Instance type to be used | `any` | n/a | yes |
| primary\_instances | Number of primary instances, including writer node | `number` | `2` | no |
| primary\_region | Primary region | `string` | `"us-east-1"` | no |
| secondary1\_enabled | Whether or not to provision secondary cluster 1 | `bool` | `false` | no |
| secondary1\_instance\_class | Instance type to be used for secondary cluster 1 | `any` | n/a | yes |
| secondary1\_instances | Number of instances for replica cluster 1 | `number` | `2` | no |
| secondary1\_region | Secondary region 1 | `string` | `"us-east-2"` | no |
| secondary2\_enabled | Whether or not to provision secondary cluster 2 | `bool` | `false` | no |
| secondary2\_instance\_class | Instance type to be used for secondary cluster 2 | `any` | n/a | yes |
| secondary2\_instances | Number of instances for replica cluster 2 | `number` | `2` | no |
| secondary2\_region | Secondary region 2 | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| app\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| bi\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| bi\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| dbs\_admin\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| dbs\_admin\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| dms\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| dms\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| global\_route53\_writer\_address | Friendly DNS name of the global Route53 writer endpoint |
| master\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| master\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_connection\_reader\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint |
| primary\_connection\_reader\_endpoint\_secret\_name | Secrets Manager Secret Name |
| primary\_connection\_writer\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint |
| primary\_connection\_writer\_endpoint\_secret\_name | Secrets Manager Secret Name |
| primary\_docdb\_cluster\_app\_database\_name | Name of application database used in baseline configuration of service login account privileges |
| primary\_docdb\_cluster\_arn | The ARN of the DocumentDB cluster |
| primary\_docdb\_cluster\_direct\_reader\_endpoint | The DocumentDB cluster direct reader endpoint |
| primary\_docdb\_cluster\_direct\_writer\_endpoint | The DocumentDB cluster direct writer endpoint |
| primary\_docdb\_cluster\_id | The ID of the DocumentDB cluster |
| primary\_docdb\_cluster\_master\_username | The master username |
| primary\_docdb\_cluster\_port | The DocumentDB port |
| primary\_docdb\_cluster\_resource\_id | The Resource ID of the DocumentDB cluster |
| primary\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |
| primary\_regional\_route53\_reader\_address | Friendly DNS name of the regional Route53 reader endpoint |
| ro\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| ro\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| secondary1\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |
| secondary2\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
