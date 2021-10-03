#!/usr/bin/env bash

# NOT TO BE USED BY PIPELINE!!!
#
# This script is only for convenience when running locally to test
#
# To use, please substitute actual values wherever "REPLACE_ME" appears
#
export AWS_REGION="REPLACE_ME"
export AWS_PROFILE="REPLACE_ME"

environment=$1
shift
action=$1
shift

vertical="REPLACE_ME"
application="REPLACE_ME"

case ${environment} in
    (dev|qat|stg|prd) ;;
    (*) printf >&2 '*** Error: first arg must be one of (dev|qat|stg|prd) ...\n'; exit 1;;
esac

case ${action} in
    (plan|apply|destroy) ;;
    (*) printf >&2 '*** Error: second arg must be one of (plan|apply|destroy) ...\n'; exit 1;;
esac

terraform init \
               -backend-config="bucket=${environment}-nebula-apps-terraform" \
               -backend-config="dynamodb_table=${environment}-nebula-apps-terraform" \
               -backend-config="key=${environment}/${vertical}/${application}.tfstate" \
               -backend-config="region=us-east-1" .

terraform $action -var-file=../environments/global.tfvars -var-file=../environments/${environment}.tfvars $@
