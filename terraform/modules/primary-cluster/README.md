<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| null | n/a |
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
| database\_name | Name for an automatically created database on cluster creation | `any` | n/a | yes |
| db\_cluster\_parameter\_group\_name | The name of a DB Cluster parameter group to use | <pre>list(object({<br>    apply_method = string<br>    name         = string<br>    value        = string<br>  }))</pre> | `[]` | no |
| db\_subnet\_group\_name | The existing subnet group name to use | `string` | `""` | no |
| deletion\_protection | If the DB instance should have deletion protection enabled | `bool` | `false` | no |
| engine\_version | DocumentDB engine version. | `string` | `"4.0.0"` | no |
| environment | The wy environment this resource will be deployed in, e.g. dev, prod. | `string` | n/a | yes |
| export\_logs | Specifies whether or not database audit and profiler logs should be exported to Cloudwatch | `bool` | `true` | no |
| global\_cluster\_identifier | The global cluster identifier specified on aws\_rds\_global\_cluster | `string` | `""` | no |
| global\_enabled | Whether or not to provision a global, multi-region cluster versus single-region cluster | `bool` | `true` | no |
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
| special | Whether or not special characters should be used when generating secrets manager value : True / False | `string` | `"false"` | no |
| tags | A map of tags to add to all resources. | `map(string)` | `{}` | no |
| ttl | TTL for friendly database CNAMEs | `number` | `300` | no |
| username | Master DB username | `string` | `"master"` | no |
| vpc\_security\_group\_ids | List of VPC security groups to associate to the cluster in addition to the SG we create in this module | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| app\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| app\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| bi\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| bi\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| connection\_reader\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint |
| connection\_reader\_endpoint\_secret\_name | Secrets Manager Secret Name |
| connection\_writer\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint |
| connection\_writer\_endpoint\_secret\_name | Secrets Manager Secret Name |
| dbs\_admin\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| dbs\_admin\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| dms\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| dms\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| docdb\_cluster\_app\_database\_name | Name of application database used in baseline configuration of service login account privileges |
| docdb\_cluster\_arn | The ARN of the DocumentDB cluster |
| docdb\_cluster\_direct\_reader\_endpoint | The DocumentDB cluster direct reader endpoint |
| docdb\_cluster\_direct\_writer\_endpoint | The DocumentDB cluster direct writer endpoint |
| docdb\_cluster\_id | The ID of the DocumentDB cluster |
| docdb\_cluster\_master\_username | The master username |
| docdb\_cluster\_port | The DocumentDB port |
| docdb\_cluster\_resource\_id | The Resource ID of the DocumentDB cluster |
| docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |
| global\_route53\_writer\_address | Friendly DNS name of the global Route53 writer endpoint |
| master\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| master\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| regional\_route53\_reader\_address | Friendly DNS name of the regional Route53 reader endpoint |
| ro\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| ro\_connection\_info\_secret\_name | Secrets Manager Secret Name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->