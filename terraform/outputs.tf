############################
# Primary Cluster outputs  #
############################

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
  value       = module.primary_cluster.global_route53_writer_address
  description = "Friendly DNS name of the global Route53 writer endpoint"
}

output "primary_regional_route53_reader_address" {
  value       = module.primary_cluster.regional_route53_reader_address
  description = "Friendly DNS name of the regional Route53 reader endpoint"
}

output "primary_docdb_cluster_arn" {
  description = "The ARN of the DocumentDB cluster"
  value       = module.primary_cluster.docdb_cluster_arn
}

output "primary_docdb_cluster_id" {
  description = "The ID of the DocumentDB cluster"
  value       = module.primary_cluster.docdb_cluster_id
}

output "primary_docdb_cluster_resource_id" {
  description = "The Resource ID of the DocumentDB cluster"
  value       = module.primary_cluster.docdb_cluster_resource_id
}

output "primary_docdb_cluster_direct_writer_endpoint" {
  description = "The DocumentDB cluster direct writer endpoint"
  value       = module.primary_cluster.docdb_cluster_direct_writer_endpoint
}

output "primary_docdb_cluster_direct_reader_endpoint" {
  description = "The DocumentDB cluster direct reader endpoint"
  value       = module.primary_cluster.docdb_cluster_direct_reader_endpoint
}

output "primary_docdb_cluster_app_database_name" {
  description = "Name of application database used in baseline configuration of service login account privileges"
  value       = module.primary_cluster.docdb_cluster_app_database_name
}

output "primary_docdb_cluster_port" {
  description = "The DocumentDB port"
  value       = module.primary_cluster.docdb_cluster_port
}

output "primary_docdb_cluster_master_username" {
  description = "The master username"
  value       = module.primary_cluster.docdb_cluster_master_username
}

output "primary_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = module.primary_cluster.docdb_cluster_security_group_id
}

output "primary_connection_writer_endpoint_secret_arn" {
  value       = module.primary_cluster.connection_writer_endpoint_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection Route53 Writer Endpoint"
}

output "primary_connection_reader_endpoint_secret_arn" {
  value       = module.primary_cluster.connection_reader_endpoint_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
}

output "master_connection_info_secret_arn" {
  value       = module.primary_cluster.master_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "dbs_admin_connection_info_secret_arn" {
  value       = module.primary_cluster.dbs_admin_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "app_connection_info_secret_arn" {
  value       = module.primary_cluster.app_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "bi_connection_info_secret_arn" {
  value       = module.primary_cluster.bi_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "ro_connection_info_secret_arn" {
  value       = module.primary_cluster.ro_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "dms_connection_info_secret_arn" {
  value       = module.primary_cluster.dms_connection_info_secret_arn
  description = "Secrets Manager Secret ARN with DB Connection information (passwords, etc)"
}

output "primary_connection_writer_endpoint_secret_name" {
  value       = module.primary_cluster.connection_writer_endpoint_secret_name
  description = "Secrets Manager Secret Name"
}

output "primary_connection_reader_endpoint_secret_name" {
  value       = module.primary_cluster.connection_reader_endpoint_secret_name
  description = "Secrets Manager Secret Name"
}

output "master_connection_info_secret_name" {
  value       = module.primary_cluster.master_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

output "dbs_admin_connection_info_secret_name" {
  value       = module.primary_cluster.dbs_admin_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

output "app_connection_info_secret_name" {
  value       = module.primary_cluster.app_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

output "bi_connection_info_secret_name" {
  value       = module.primary_cluster.bi_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

output "ro_connection_info_secret_name" {
  value       = module.primary_cluster.ro_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

output "dms_connection_info_secret_name" {
  value       = module.primary_cluster.dms_connection_info_secret_name
  description = "Secrets Manager Secret Name"
}

###################################################################################
# Secondary Cluster #1 outputs.
###################################################################################

###################################################################################
# The following commented-out variable definitions are placeholders for the future
# when Terraform AWS provider will support DocumentDB global cluster creation.
#
#output "secondary1_regional_route53_reader_address" {
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.regional_route53_reader_address : null
#  description = "Friendly DNS name of the regional Route53 reader endpoint"
#}
#
#output "secondary1_docdb_cluster_arn" {
#  description = "The ARN of the DocumentDB cluster"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_arn : null
#}
#
#output "secondary1_docdb_cluster_id" {
#  description = "The ID of the DocumentDB cluster"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_id : null
#}
#
#output "secondary1_docdb_cluster_resource_id" {
#  description = "The Resource ID of the DocumentDB cluster"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_resource_id : null
#}
#
#output "secondary1_docdb_cluster_direct_writer_endpoint" {
#  description = "The DocumentDB cluster direct writer endpoint"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_direct_writer_endpoint : null
#}
#
#output "secondary1_docdb_cluster_direct_reader_endpoint" {
#  description = "The DocumentDB cluster direct reader endpoint"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_direct_reader_endpoint : null
#}
#
#output "secondary1_docdb_cluster_port" {
#  description = "The DocumentDB port"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_port : null
#}
#
#output "secondary1_docdb_cluster_master_username" {
#  description = "The master username"
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_master_username : null
#}
#
#output "secondary1_connection_reader_endpoint_secret_arn" {
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.connection_reader_endpoint_secret_arn : null
#  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
#}
#
#output "secondary1_connection_reader_endpoint_secret_name" {
#  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.connection_reader_endpoint_secret_name : null
#  description = "Secrets Manager Secret Name"
#}

output "secondary1_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = var.secondary1_enabled == true ? module.secondary_cluster_1.*.docdb_cluster_security_group_id : null
}



###################################################################################
# Secondary Cluster #2 outputs.
###################################################################################

###################################################################################
# The following commented-out variable definitions are placeholders for the future
# when Terraform AWS provider will support DocumentDB global cluster creation.
#
#output "secondary2_regional_route53_reader_address" {
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.regional_route53_reader_address : null
#  description = "Friendly DNS name of the regional Route53 reader endpoint"
#}
#
#output "secondary2_docdb_cluster_arn" {
#  description = "The ARN of the DocumentDB cluster"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_arn : null
#}
#
#output "secondary2_docdb_cluster_id" {
#  description = "The ID of the DocumentDB cluster"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_id : null
#}
#
#output "secondary2_docdb_cluster_resource_id" {
#  description = "The Resource ID of the DocumentDB cluster"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_resource_id : null
#}
#
#output "secondary2_docdb_cluster_direct_writer_endpoint" {
#  description = "The DocumentDB cluster direct writer endpoint"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_direct_writer_endpoint : null
#}
#
#output "secondary2_docdb_cluster_direct_reader_endpoint" {
#  description = "The DocumentDB cluster direct reader endpoint"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_direct_reader_endpoint : null
#}
#
#output "secondary2_docdb_cluster_port" {
#  description = "The DocumentDB port"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_port : null
#}
#
#output "secondary2_docdb_cluster_master_username" {
#  description = "The master username"
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_master_username : null
#}
#
#output "secondary2_connection_reader_endpoint_secret_arn" {
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.connection_reader_endpoint_secret_arn : null
#  description = "Secrets Manager Secret ARN with DB Connection Route53 Reader Endpoint"
#}
#
#output "secondary2_connection_reader_endpoint_secret_name" {
#  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.connection_reader_endpoint_secret_name : null
#  description = "Secrets Manager Secret Name"
#}


output "secondary2_docdb_cluster_security_group_id" {
  description = "The security group ID of the DocumentDB cluster"
  value       = var.secondary2_enabled == true ? module.secondary_cluster_2.*.docdb_cluster_security_group_id : null
}
