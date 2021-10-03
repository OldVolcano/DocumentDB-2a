##############################################################
# For the PRD environment, below are example parameters to use
# for global, multi-region, symmetric topology.  This example
# shows that though the second replica region (secondary2/us-west-2)
# is enabled, it has 0 instances and therefore is "headless" with
# only a cluster with replicated storage volume.
# 
environment = "prd"
account_id  = "442841151894"

# Database specific information
db_engine_version = "4.0.0"
global_enabled    = true

# Primary region
primary_instance_class = "db.r5.2xlarge"
primary_instances      = 3
primary_region         = "us-east-1"

# Secondary region 1 - only effective when global_enabled = true
secondary1_enabled        = true
secondary1_instance_class = "db.r5.2xlarge"
secondary1_instances      = 3
secondary1_region         = "us-east-2"

# Secondary region 2 - only effective when global_enabled = true
secondary2_enabled        = true
secondary2_instance_class = "db.r5.large"
secondary2_instances      = 0
secondary2_region         = "us-west-2"
