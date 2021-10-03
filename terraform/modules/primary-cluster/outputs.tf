######################################################################
# These global cluster outputs are commented out for now, because they
# reference the aws_docdb_global_cluster module that is commented out
#
#output "global_cluster_arn" {
#  description = "The ARN of the Aurora RDS global cluster"
#  value       = try(aws_docdb_global_cluster.global_cluster.*.arn, null)
#}
#
#output "global_cluster_id" {
#  description = "The ID of the Aurora RDS global cluster"
#  value       = try(aws_docdb_global_cluster.global_cluster.*.id, null)
#}
#
#output "global_cluster_resource_id" {
#  description = "The Resource ID of the Aurora RDS global cluster"
#  value       = try(aws_docdb_global_cluster.global_cluster.*.global_cluster_resource_id, null)
#}

output "global_route53_writer_address" {
  value       = aws_route53_record.global_writer_address.fqdn
  description = "Friendly DNS name of the global Route53 writer endpoint"
}

output "regional_route53_reader_address" {
  value       = aws_route53_record.regional_reader_address.fqdn
  description = "Friendly DNS name of the regional Route53 reader endpoint"
}

output "docdb_cluster_arn" {
  description = "The ARN of the DocumentDB cluster"
  value       = aws_docdb_cluster.primary.arn
}

output "docdb_cluster_id" {
  description = "The ID of the DocumentDB cluster"
  value       = aws_docdb_cluster.primary.id
}

output "docdb_cluster_resource_id" {
  description = "The Resource ID of the DocumentDB cluster"
  value       = aws_docdb_cluster.primary.cluster_resource_id
}

output "docdb_cluster_direct_writer_endpoint" {
  description = "The DocumentDB cluster direct writer endpoint"
  value       = aws_docdb_cluster.primary.endpoint
}

output "docdb_cluster_direct_reader_endpoint" {
  description = "The DocumentDB cluster direct reader endpoint"
  value       = aws_docdb_cluster.primary.reader_endpoint
}

output "docdb_cluster_app_database_name" {
  description = "Name of application database used in baseline configuration of service login account privileges"
  value       = var.database_name
}

output "docdb_cluster_port" {
  description = "The DocumentDB port"
  value       = aws_docdb_cluster.primary.port
}

output "docdb_cluster_master_username" {
  description = "The master username"
  value       = aws_docdb_cluster.primary.master_username
}

output "docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = local.docdb_security_group_id
}

output "connection_writer_endpoint_secret_arn" {
  value       = module.db_writer_endpoint.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint"
}

output "connection_reader_endpoint_secret_arn" {
  value       = module.db_reader_endpoint.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
}

output "master_connection_info_secret_arn" {
  value       = module.master_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "dbs_admin_connection_info_secret_arn" {
  value       = module.dbs_admin_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "app_connection_info_secret_arn" {
  value       = module.app_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "bi_connection_info_secret_arn" {
  value       = module.bi_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "ro_connection_info_secret_arn" {
  value       = module.ro_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "dms_connection_info_secret_arn" {
  value       = module.dms_db_password.secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "connection_writer_endpoint_secret_name" {
  value       = module.db_writer_endpoint.secret_name
  description = "Secrets Manager Secret Name"
}

output "connection_reader_endpoint_secret_name" {
  value       = module.db_reader_endpoint.secret_name
  description = "Secrets Manager Secret Name"
}

output "master_connection_info_secret_name" {
  value       = module.master_db_password.secret_name
  description = "Secrets Manager Secret Name"
}

output "dbs_admin_connection_info_secret_name" {
  value       = module.dbs_admin_db_password.secret_name
  description = "Secrets Manager Secret Name"
}

output "app_connection_info_secret_name" {
  value       = module.app_db_password.secret_name
  description = "Secrets Manager Secret Name"
}

output "bi_connection_info_secret_name" {
  value       = module.bi_db_password.secret_name
  description = "Secrets Manager Secret Name"
}

output "ro_connection_info_secret_name" {
  value       = module.ro_db_password.secret_name
  description = "Secrets Manager Secret Name"
}

output "dms_connection_info_secret_name" {
  value       = module.dms_db_password.secret_name
  description = "Secrets Manager Secret Name"
}
