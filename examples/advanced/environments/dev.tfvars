##############################################################
# For the DEV environment, below are example parameters to use
# for single-region, non-global cluster to minimize costs. Note
# that since global_enabled is set to false, the secondary
# region clusters are not applicable and are both disabled.
#
environment = "dev"
account_id  = "442841151894"

# Database specific information
db_engine_version = "4.0.0"
global_enabled    = false

# Primary region
primary_instance_class = "db.t3.medium"
primary_instances      = 1
primary_region         = "us-east-1"

# Secondary region 1 - only effective when global_enabled = true
secondary1_enabled        = false
secondary1_instance_class = "db.r5.large"
secondary1_instances      = 1
secondary1_region         = "us-east-2"

# Secondary region 2 - only effective when global_enabled = true
secondary2_enabled        = false
secondary2_instance_class = "db.r5.large"
secondary2_instances      = 1
secondary2_region         = "us-west-2"
