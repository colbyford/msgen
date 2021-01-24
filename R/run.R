#' @title Interact with the Microsoft Genomics service in Azure
#' 
#' @name workflows
#' 
#' @description Submit, list, check the status, and cancel genomics workflows in the Microsoft Genomics service in Azure.
#' 
#' @param region Region of your Microsoft Genomics service. (Example = `"eastus"`)
#' @param subscription_key Subscription key for your Microsoft Genomics service. (Example = "04afabfc1af94c8285faec2f15e4e459")
#'   Go to Azure portal and open your Genomics account page. Under the `Management` heading, choose `Access keys`. There, you find both the API URL and your access keys.
#' @param description Description string for your submission. (Default = "Submission from msgen R package.")
#' @param process Defines which pipeline to run. Either `"snapgatk"` (default) or `"gatk4"`.
#' @param reference Process arguments for specifying a reference genome. Select from `"b37m1"`, `"hg38m1"`, `"hg38m1x"`, or `"hg19m1"` (default).
#' @param input_storage_account_name Azure storage account name where input files reside.
#' @param input_storage_account_key Azure storage account key which will be used to create temporary access tokens for input files.
#' @param input_container_name Azure blob container where input files reside.
#' @param blob_name_1 First file name.
#' @param blob_name_2 Second file name, needed only if input is in the FASTQ format.
#' @param output_storage_account_name Azure storage account name where output files will be placed. (Optional: Will default to input storage account if not specified.)
#' @param output_storage_account_key Azure storage account key which will be used to create a temporary access token for an output container. (Optional: Will default to input key if not specified.)
#' @param output_container_name Azure blob container where output files will be placed. (Optional: Will default to input container if not specified.)
#' @param workflow_id Workflow ID returned after submitting a job.
#' 
#' @usage 
#' submit_workflow(subscription_key,
#'        region,
#'        description = "Submission from msgen R package.",
#'        process = "snapgatk",
#'        reference = "hg19m1",
#'        input_storage_account_name,
#'        input_storage_account_key,
#'        input_container_name,
#'        blob_name_1,
#'        blob_name_2 = NULL,
#'        output_storage_account_name,
#'        output_storage_account_key,
#'        output_container_name)
#'        
#' list_workflows(subscription_key,
#'      region)
#'           
#' get_workflow_status(subscription_key,
#'        region,
#'        workflow_id = NULL)
#'           
#' cancel_workflow(subscription_key,
#'        region,
#'        workflow_id = NULL)
#' 
#' @examples 
#' submit_workflow(subscription_key = "04afabfc...",
#'        region = "eastus",
#'        process = "snapgatk",
#'        reference = "b37m1",
#'        input_storage_account_name = "mygenomicsstorage",
#'        input_storage_account_key= "6GyBAbvgw5sqo2...",
#'        input_storage_account_container = "myinputdata",
#'        blob_name_1 = "NA12878-chr21_1.fq.gz",
#'        blob_name_2 = "NA12878-chr21_2.fq.gz")
#'        
#' list_workflows(subscription_key = "04afabfc...",
#'      region = "eastus",)
#'      
#' get_workflow_status(subscription_key = "04afabfc...",
#'        region = "eastus",
#'        workflow_id = "12g3c5a...")
#' 
#' cancel_workflow(subscription_key = "04afabfc...",
#'        region = "eastus",
#'        workflow_id = "12g3c5a...")
#' 
#' @export submit_workflow
#' @export list_workflows
#' @export get_workflow_status
#' @export cancel_workflow
####################


list_workflows <- function(subscription_key,
                 region){
  
  url <- paste0("https://", region, ".microsoftgenomics.net/api/workflows/")
  
  res <- GET(url, add_headers(`Ocp-Apim-Subscription-Key` = subscription_key,
                            `Content-Type` = "application/json",
                            `User-Agent` = "Microsoft Genomics R Client"))
  
  output <- as.data.frame(do.call(rbind, content(res)))
  
  return(output)
  
}

submit_workflow <- function(subscription_key,
                   region,
                   description = "Submission from msgen R package.",
                   process = "snapgatk",
                   reference = "hg19m1",
                   input_storage_account_name,
                   input_storage_account_key,
                   input_container_name,
                   blob_name_1,
                   blob_name_2 = NULL,
                   output_storage_account_name = input_storage_account_name,
                   output_storage_account_key = input_storage_account_key,
                   output_container_name = input_container_name){
  
  reference = paste0("R=", reference)
  
  input_continer_sas <- AzureStor::get_account_sas(input_storage_account_name,
                                          key = input_storage_account_key)
  
  output_container_sas <- AzureStor::get_account_sas(output_storage_account_name,
                                                     key = output_storage_account_key)
  
  blobnames_with_sas <- paste(paste0(blob_name_1, "?", input_continer_sas),
                              if(!is.null(blob_name_2)){
                                paste0(blob_name_2, "?", input_continer_sas)
                              },
                              sep = ",")
  
  
  url <- paste0("https://", region, ".microsoftgenomics.net/api/workflows/")
  
  
  body <- list(WorkflowClass = "",
               Description = description,
               InputArgs = list(
                 BLOBNAMES_WITH_SAS = blobnames_with_sas,
                 ACCOUNT = input_storage_account_name,
                 CONTAINER = input_container_name,
                 BLOBNAMES = paste(c(blob_name_1,
                                     blob_name_2),
                                   collapse = ",")
               ),
               InputStorageType = "AZURE_BLOCK_BLOB",
               OutputArgs = list(
                 ACCOUNT = output_storage_account_name,
                 CONTAINER = output_container_name,
                 CONTAINER_SAS = output_container_sas,
                 OUTPUT_INCLUDE_LOGFILES = TRUE,
                 OVERWRITE = FALSE,
                 OUTPUT_FILENAME_BASE = ""
               ),
               OutputStorageType = "AZURE_BLOCK_BLOB",
               ProcessArgs = reference,
               Process = process,
               OptionalArgs = list(),
               IgnoreAzureRegion = NULL
  )
  
  res <- POST(url, add_headers(`Ocp-Apim-Subscription-Key` = subscription_key,
                               `Content-Type` = "application/json",
                               `User-Agent` = "Microsoft Genomics R Client"),
              body = body,
              encode = "json")
  
  output <- as.data.frame(t(do.call(rbind, content(res))))
  
  return(output)
}


get_workflow_status <- function(subscription_key,
                   region,
                   workflow_id = NULL){
  
  
  url <- paste0("https://", region, ".microsoftgenomics.net/api/workflows/", workflow_id)
  
  res <- GET(url, add_headers(`Ocp-Apim-Subscription-Key` = subscription_key,
                              `Content-Type` = "application/json",
                              `User-Agent` = "Microsoft Genomics R Client"))
  
  output <- as.data.frame(t(do.call(rbind, content(res))))
  
  return(output)
  
}


cancel_workflow <- function(subscription_key,
                   region,
                   workflow_id = NULL){
  
  url <- paste0("https://", region, ".microsoftgenomics.net/api/workflows/", workflow_id)
  
  res <- DELETE(url, add_headers(`Ocp-Apim-Subscription-Key` = subscription_key,
                              `Content-Type` = "application/json",
                              `User-Agent` = "Microsoft Genomics R Client"))
  
  output <- as.data.frame(t(do.call(rbind, content(res))))
  
  return(output)
  
}