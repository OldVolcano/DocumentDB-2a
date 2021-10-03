output "global_cluster_arn" {
  description = "The ARN of the Aurora RDS global cluster"
  value       = try(module.document_db.global_cluster_arn, null)
}

output "global_cluster_id" {
  description = "The ID of the Aurora RDS global cluster"
  value       = try(module.document_db.global_cluster_id, null)
}

output "global_cluster_resource_id" {
  description = "The Resource ID of the Aurora RDS global cluster"
  value       = try(module.document_db.global_cluster_resource_id, null)
}

output "primary_global_route53_writer_address" {
  description = "Friendly DNS name of the global Route53 writer endpoint"
  value       = module.document_db.global_route53_writer_address
}

output "primary_regional_route53_reader_address" {
  description = "Friendly DNS name of the regional Route53 reader endpoint"
  value       = module.document_db.primary_regional_route53_reader_address
}

output "primary_docdb_cluster_arn" {
  description = "The ARN of the DocumentDB cluster"
  value       = module.document_db.primary_docdb_cluster_arn
}

output "primary_docdb_cluster_id" {
  description = "The ID of the DocumentDB cluster"
  value       = module.document_db.primary_docdb_cluster_id
}

output "primary_docdb_cluster_resource_id" {
  description = "The Resource ID of the DocumentDB cluster"
  value       = module.document_db.primary_docdb_cluster_resource_id
}

output "primary_docdb_cluster_direct_writer_endpoint" {
  description = "The DocumentDB cluster direct writer endpoint"
  value       = module.document_db.primary_docdb_cluster_direct_writer_endpoint
}

output "primary_docdb_cluster_direct_reader_endpoint" {
  description = "The DocumentDB cluster direct reader endpoint"
  value       = module.document_db.primary_docdb_cluster_direct_reader_endpoint
}

output "primary_docdb_cluster_app_database_name" {
  description = "Name of application database used in baseline configuration of service login account privileges"
  value       = module.document_db.primary_docdb_cluster_app_database_name
}

output "primary_docdb_cluster_port" {
  description = "The DocumentDB port"
  value       = module.document_db.primary_docdb_cluster_port
}

output "primary_docdb_cluster_master_username" {
  description = "The master username"
  value       = module.document_db.primary_docdb_cluster_master_username
}

output "primary_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = module.document_db.primary_docdb_cluster_security_group_id
}

output "primary_connection_writer_endpoint_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint"
  value       = module.document_db.primary_connection_writer_endpoint_secret_arn
}

output "primary_connection_reader_endpoint_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
  value       = module.document_db.primary_connection_reader_endpoint_secret_arn
}

output "primary_master_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.master_connection_info_secret_arn
}

output "primary_dbs_admin_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.dbs_admin_connection_info_secret_arn
}

output "primary_app_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.app_connection_info_secret_arn
}

output "primary_bi_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.bi_connection_info_secret_arn
}

output "primary_ro_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.ro_connection_info_secret_arn
}

output "primary_dms_connection_info_secret_arn" {
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
  value       = module.document_db.dms_connection_info_secret_arn
}

output "primary_connection_writer_endpoint_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.primary_connection_writer_endpoint_secret_name
}

output "primary_connection_reader_endpoint_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.primary_connection_reader_endpoint_secret_name
}

output "primary_master_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.master_connection_info_secret_name
}

output "primary_dbs_admin_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.dbs_admin_connection_info_secret_name
}

output "primary_app_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.app_connection_info_secret_name
}

output "primary_bi_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.bi_connection_info_secret_name
}

output "primary_ro_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.ro_connection_info_secret_name
}

output "primary_dms_connection_info_secret_name" {
  description = "Secrets Manager Secret Name"
  value       = module.document_db.dms_connection_info_secret_name
}

output "secondary1_regional_route53_reader_address" {
  description = "Friendly DNS name of the secondary cluster1 Route53 reader endpoint"
  value       = try(module.document_db.*.secondary1_regional_route53_reader_address, null)
}

output "secondary2_regional_route53_reader_address" {
  description = "Friendly DNS name of the secondary cluster2 Route53 reader endpoint"
  value       = try(module.document_db.*.secondary2_regional_route53_reader_address, null)
}

output "secondary1_docdb_cluster_arn" {
  description = "The ARN of the DocumentDB secondary cluster 1"
  value       = try(module.document_db.*.secondary1_docdb_cluster_arn, null)
}

output "secondary2_docdb_cluster_arn" {
  description = "The ARN of the DocumentDB secondary cluster 2"
  value       = try(module.document_db.*.secondary2_docdb_cluster_arn, null)
}

output "secondary1_docdb_cluster_id" {
  description = "The ID of the DocumentDB secondary cluster 1"
  value       = try(module.document_db.*.secondary1_docdb_cluster_id, null)
}

output "secondary2_docdb_cluster_id" {
  description = "The ID of the DocumentDB secondary cluster 2"
  value       = try(module.document_db.*.secondary2_docdb_cluster_id, null)
}

output "secondary1_docdb_cluster_resource_id" {
  description = "The Resource ID of the DocumentDB secondary cluster 1"
  value       = try(module.document_db.*.secondary1_docdb_cluster_resource_id, null)
}

output "secondary2_docdb_cluster_resource_id" {
  description = "The Resource ID of the DocumentDB secondary cluster 2"
  value       = try(module.document_db.*.secondary2_docdb_cluster_resource_id, null)
}

output "secondary1_docdb_cluster_direct_reader_endpoint" {
  description = "The direct reader endpoint for DocumentDB secondary cluster 1"
  value       = try(module.document_db.*.secondary1_docdb_cluster_direct_reader_endpoint, null)
}

output "secondary2_docdb_cluster_direct_reader_endpoint" {
  description = "The direct reader endpoint for DocumentDB secondary cluster 2"
  value       = try(module.document_db.*.secondary2_docdb_cluster_direct_reader_endpoint, null)
}

output "secondary1_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB secondary cluster 1"
  value       = try(module.document_db.*.secondary1_docdb_cluster_security_group_id, null)
}

output "secondary2_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB secondary cluster 2"
  value       = try(module.document_db.*.secondary2_docdb_cluster_security_group_id, null)
}

output "secondary1_connection_reader_endpoint_secret_arn" {
  value       = try(module.document_db.*.secondary1_connection_reader_endpoint_secret_arn, null)
  description = "Regional Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint for Secondary Cluster 1"
}

output "secondary2_connection_reader_endpoint_secret_arn" {
  value       = try(module.document_db.*.secondary2_connection_reader_endpoint_secret_arn, null)
  description = "Regional Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint for Secondary Cluster 2"
}

output "secondary1_connection_reader_endpoint_secret_name" {
  value       = try(module.document_db.*.secondary1_connection_reader_endpoint_secret_name, null)
  description = "Secrets Manager Secret Name"
}

output "secondary2_connection_reader_endpoint_secret_name" {
  value       = try(module.document_db.*.secondary2_connection_reader_endpoint_secret_name, null)
  description = "Secrets Manager Secret Name"
}
