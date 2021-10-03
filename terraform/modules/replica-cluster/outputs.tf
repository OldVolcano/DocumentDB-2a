###################################################################################
# The following commented-out variable definitions are placeholders for the future
# when Terraform AWS provider will support DocumentDB global cluster creation.
#
#output "regional_route53_reader_address" {
#  value       = aws_route53_record.regional_reader_address.fqdn
#  description = "Friendly DNS name of the regional Route53 reader endpoint"
#}
#
#output "docdb_cluster_arn" {
#  description = "The ARN of the DocumentDB cluster"
#  value       = aws_docdb_cluster.secondary.arn
#}
#
#output "docdb_cluster_id" {
#  description = "The ID of the DocumentDB cluster"
#  value       = aws_docdb_cluster.secondary.id
#}
#
#output "docdb_cluster_resource_id" {
#  description = "The Resource ID of the DocumentDB cluster"
#  value       = aws_docdb_cluster.secondary.cluster_resource_id
#}
#
#output "docdb_cluster_direct_writer_endpoint" {
#  description = "The DocumentDB cluster direct writer endpoint"
#  value       = aws_docdb_cluster.secondary.endpoint
#}
#
#output "docdb_cluster_direct_reader_endpoint" {
#  description = "The DocumentDB cluster direct reader endpoint"
#  value       = aws_docdb_cluster.secondary.reader_endpoint
#}
#
#output "docdb_cluster_port" {
#  description = "The DocumentDB port"
#  value       = aws_docdb_cluster.secondary.port
#}
#
#output "docdb_cluster_master_username" {
#  description = "The master username"
#  value       = aws_docdb_cluster.secondary.master_username
#}
#
#output "connection_reader_endpoint_secret_arn" {
#  value       = module.db_reader_endpoint.secret_arn
#  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
#}
#
#output "connection_reader_endpoint_secret_name" {
#  value       = module.db_reader_endpoint.secret_name
#  description = "Secrets Manager Secret Name"
#}

output "docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = local.docdb_security_group_id
}

