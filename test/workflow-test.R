library(msgen)


subscription_key <- "b999a06499c04556b217ed39801e5801"
region <- "eastus"
description = "Test submission from msgen R package."
process = "snapgatk"
reference = "hg19m1"
input_storage_account_name = "genomicsdls"
input_storage_account_key = "U7lAIWxJpzopeE7zt1M1sWZUt7tpmKF/z/tLj3ztmMsD0se7vYIWx+P+hC+Yd9COgl4p/yzFi4wp9nkVhM/H7g=="
input_container_name = "msgen-test"
blob_name_1 = "input/chr21_1.fq.gz"
blob_name_2 = "input/chr21_2.fq.gz"
output_container_name = "msgen-test/output"


submit_workflow(subscription_key,
       region,
       description,
       process,
       reference,
       input_storage_account_name,
       input_storage_account_key,
       input_container_name,
       blob_name_1,
       blob_name_2)

list_workflows(subscription_key,
     region)

get_workflow_status(subscription_key,
       region,
       workflow_id = 10001)

cancel_workflow(subscription_key,
       region,
       workflow_id = 10001)

