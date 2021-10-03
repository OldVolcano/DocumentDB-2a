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
| app\_name | The name of the application that this resource belongs to. | `string` | n/a | yes |
| apply\_immediately | Determines whether or not any DB modifications are applied immediately, or during the maintenance window | `bool` | `false` | no |
| audit\_logs | n/a | `string` | `"enabled"` | no |
| backup\_retention\_period | How long to keep backups for (in days) | `number` | `7` | no |
| cost\_center | The wy cost center that this resource belongs to, e.g. IT - Supply Chain | `string` | n/a | yes |
| data\_classification | The level of data sensitity of data on or through this resource. pci \| <empty> | `string` | n/a | yes |
| db\_cluster\_parameter\_group\_name | The name of a DB Cluster parameter group to use | <pre>list(object({<br>    apply_method = string<br>    name         = string<br>    value        = string<br>  }))</pre> | `[]` | no |
| db\_subnet\_group\_name | The existing subnet group name to use | `string` | `""` | no |
| deletion\_protection | If the DB instance should have deletion protection enabled | `bool` | `false` | no |
| engine\_version | DocumentDB engine version. | `string` | `"4.0.0"` | no |
| environment | The wy environment this resource will be deployed in, e.g. dev, prod. | `string` | n/a | yes |
| export\_logs | Specifies whether or not database audit and profiler logs should be exported to Cloudwatch | `bool` | `true` | no |
| global\_cluster\_identifier | The global cluster identifier specified on aws\_rds\_global\_cluster | `string` | `""` | no |
| ingress\_security\_groups | A list of Security Group ID's to allow access to. | `list(string)` | `[]` | no |
| instance\_type | Instance type to use.  Smallest available in AWS for non-global cluster is db.t3.medium.  Smallest available in AWS for global cluster is db.r5.large. | `string` | `"db.r5.large"` | no |
| kms\_db\_key\_arn | DocumentDB KMS for database | `any` | n/a | yes |
| number\_instances | Number of instances to create in the cluster.  At least 2 are required to ensure high-availability in-region failover capability. | `number` | `1` | no |
| owner\_email | A distribution list that contains the owners of this resource. Do not specifiy an individual's email address. | `string` | n/a | yes |
| preferred\_backup\_window | When to perform DB backups | `string` | `"02:00-03:00"` | no |
| preferred\_maintenance\_window | When to perform DB maintenance | `string` | `"sun:05:00-sun:06:00"` | no |
| profiler | n/a | `string` | `"disabled"` | no |
| region | The wy region where the cluster will be created. | `string` | n/a | yes |
| skip\_final\_snapshot | Should a final snapshot be created on cluster destroy | `bool` | `false` | no |
| snapshot\_identifier | DB snapshot to create this database from | `string` | `""` | no |
| source\_region | The source region for an encrypted replica DB cluster. | `string` | `""` | no |
| special | Whether or not special characters should be used when generating secrets manager value : True / False | `string` | `"false"` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| ttl | TTL for friendly database CNAMEs | `number` | `300` | no |
| vpc\_security\_group\_ids | List of VPC security groups to associate to the cluster in addition to the SG we create in this module | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->