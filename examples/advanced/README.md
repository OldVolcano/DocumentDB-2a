# AWS DocumentDB Terraform Configuration Example

This is just one possible example of a Terraform configuration for provisioning a DocumentDB cluster and related resources.  Before using, the placeholder string "REPLACE_ME" would need to be replaced with suitable values in all files where it appears.  These include the .tfvars files in the environments directory, data.tf file in the terraform directory, docdb.tf file in the terraform directory, and if applicable, the local_exec.sh bash script in the terraform directory.

## Pre-Requisites
  * Minimum Terraform version required due to module depends_on is v0.13.6
  * Required DocumentDB engine_version "4.0.0"
  * MongoDB 4.0 drivers
  * MongoDB Shell (mongosh) 1.0.x
  * Bash 

## Documentation

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.6 |
| aws | ~> 3.51.0 |

## Providers

| Name | Version |
|------|---------|
| aws.primary | ~> 3.51.0 |
| aws.secondary1 | ~> 3.51.0 |
| aws.secondary2 | ~> 3.51.0 |

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
| owner\_email | A distribution list that contains the owners of this resource. Do not specifiy an individual's email address. | `string` | n/a | yes |
| primary\_instance\_class | Instance type to be used | `any` | n/a | yes |
| primary\_instances | Number of primary instances, including writer node | `number` | `2` | no |
| primary\_region | Primary region | `string` | `"us-east-1"` | no |
| secondary1\_enabled | Whether or not to provision secondary cluster 1 | `bool` | `true` | no |
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
| global\_cluster\_arn | The ARN of the Aurora RDS global cluster |
| global\_cluster\_id | The ID of the Aurora RDS global cluster |
| global\_cluster\_resource\_id | The Resource ID of the Aurora RDS global cluster |
| primary\_app\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_app\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_bi\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_bi\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_connection\_reader\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint |
| primary\_connection\_reader\_endpoint\_secret\_name | Secrets Manager Secret Name |
| primary\_connection\_writer\_endpoint\_secret\_arn | Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint |
| primary\_connection\_writer\_endpoint\_secret\_name | Secrets Manager Secret Name |
| primary\_dbs\_admin\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_dbs\_admin\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_dms\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_dms\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_docdb\_cluster\_app\_database\_name | Name of application database used in baseline configuration of service login account privileges |
| primary\_docdb\_cluster\_arn | The ARN of the DocumentDB cluster |
| primary\_docdb\_cluster\_direct\_reader\_endpoint | The DocumentDB cluster direct reader endpoint |
| primary\_docdb\_cluster\_direct\_writer\_endpoint | The DocumentDB cluster direct writer endpoint |
| primary\_docdb\_cluster\_id | The ID of the DocumentDB cluster |
| primary\_docdb\_cluster\_master\_username | The master username |
| primary\_docdb\_cluster\_port | The DocumentDB port |
| primary\_docdb\_cluster\_resource\_id | The Resource ID of the DocumentDB cluster |
| primary\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB cluster |
| primary\_global\_route53\_writer\_address | Friendly DNS name of the global Route53 writer endpoint |
| primary\_master\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_master\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| primary\_regional\_route53\_reader\_address | Friendly DNS name of the regional Route53 reader endpoint |
| primary\_ro\_connection\_info\_secret\_arn | Secrets Manager Secret ARN with DB Connection information (passwords, etc) |
| primary\_ro\_connection\_info\_secret\_name | Secrets Manager Secret Name |
| secondary1\_connection\_reader\_endpoint\_secret\_arn | Regional Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint for Secondary Cluster 1 |
| secondary1\_connection\_reader\_endpoint\_secret\_name | Secrets Manager Secret Name |
| secondary1\_docdb\_cluster\_arn | The ARN of the DocumentDB secondary cluster 1 |
| secondary1\_docdb\_cluster\_direct\_reader\_endpoint | The direct reader endpoint for DocumentDB secondary cluster 1 |
| secondary1\_docdb\_cluster\_id | The ID of the DocumentDB secondary cluster 1 |
| secondary1\_docdb\_cluster\_resource\_id | The Resource ID of the DocumentDB secondary cluster 1 |
| secondary1\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB secondary cluster 1 |
| secondary1\_regional\_route53\_reader\_address | Friendly DNS name of the secondary cluster1 Route53 reader endpoint |
| secondary2\_connection\_reader\_endpoint\_secret\_arn | Regional Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint for Secondary Cluster 2 |
| secondary2\_connection\_reader\_endpoint\_secret\_name | Secrets Manager Secret Name |
| secondary2\_docdb\_cluster\_arn | The ARN of the DocumentDB secondary cluster 2 |
| secondary2\_docdb\_cluster\_direct\_reader\_endpoint | The direct reader endpoint for DocumentDB secondary cluster 2 |
| secondary2\_docdb\_cluster\_id | The ID of the DocumentDB secondary cluster 2 |
| secondary2\_docdb\_cluster\_resource\_id | The Resource ID of the DocumentDB secondary cluster 2 |
| secondary2\_docdb\_cluster\_security\_group\_id | The security group ID of the DocumentDB secondary cluster 2 |
| secondary2\_regional\_route53\_reader\_address | Friendly DNS name of the secondary cluster2 Route53 reader endpoint |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
