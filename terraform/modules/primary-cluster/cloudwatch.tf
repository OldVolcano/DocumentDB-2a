###
/* DocumentDB logging
DocumentDB expects a log group to follow the following format /aws/docdb/db-cluster-name/log_type.
Here, the firehose subscriptions to the log groups for the cluster is created, but only after the cluster 
writer is complete.  These dependencies ensure that the log groups exist so that subscription provisioning 
does not fail.
*/

locals {
  audit_log_group_name    = join("", ["/aws/docdb/", aws_docdb_cluster.primary.cluster_identifier, "/audit"])
  profiler_log_group_name = join("", ["/aws/docdb/", aws_docdb_cluster.primary.cluster_identifier, "/profiler"])
}

resource "aws_cloudwatch_log_subscription_filter" "docdb_audit_log_subscription" {
  count           = var.export_logs ? 1 : 0
  name            = "docdb_audit_log_subscription"
  role_arn        = module.core_info.logging_cloudwatch_iam_role_arn
  log_group_name  = local.audit_log_group_name
  filter_pattern  = ""
  destination_arn = module.core_info.logging_firehose_arn
  distribution    = "Random"

  depends_on = [
    aws_docdb_cluster_instance.primary_instance,
  ]
}

/* For profiler, we must explictly create the Cloudwatch log group in order for the subscription filter to be created.
The reason is that DocumentDB by default will not create the log group right away even if profiler logs are exported.
It would only create the log group when a long-running operation is detected and logged.
*/
resource "aws_cloudwatch_log_group" "docdb_profiler_log_group" {
  count = var.export_logs ? 1 : 0
  name  = local.profiler_log_group_name
}

resource "aws_cloudwatch_log_subscription_filter" "docdb_profiler_log_subscription" {
  count           = var.export_logs ? 1 : 0
  name            = "docdb_profiler_log_subscription"
  role_arn        = module.core_info.logging_cloudwatch_iam_role_arn
  log_group_name  = local.profiler_log_group_name
  filter_pattern  = ""
  destination_arn = module.core_info.logging_firehose_arn
  distribution    = "Random"

  depends_on = [
    aws_docdb_cluster_instance.primary_instance,
    aws_cloudwatch_log_group.docdb_profiler_log_group,
  ]
}
