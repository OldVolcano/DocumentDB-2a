#!/usr/bin/env bash

if [ "$#" -lt 2 ]; then
    echo "*** Error: you must supply environment and action"
    exit 1
fi

environment=$1
shift
action=$1
shift

case ${environment} in
    (dev|qat|stg|prd) ;;
    (*) printf >&2 '*** Error: first arg must be one of (dev|qat|stg|prd) ...\n'; exit 1;;
esac

case ${action} in
    (plan|apply) ;;
    (*) printf >&2 '*** Error: second arg must be one of (plan|apply) ...\n'; exit 1;;
esac

vertical=@verticalName@
application=@applicationName@

cd /config
/bin/terraform init \
               -backend-config="bucket=${environment}-nebula-apps-terraform" \
               -backend-config="dynamodb_table=${environment}-nebula-apps-terraform" \
               -backend-config="key=${environment}/${vertical}/${application}.tfstate" \
               -backend-config="region=us-east-1" .

/bin/terraform $action -var-file=global.tfvars -var-file=${environment}.tfvars $@
