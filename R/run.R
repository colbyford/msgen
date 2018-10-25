#' @title Interact with the Microsoft Genomics service in Azure
#' 
#' @description Submit, list, check the status, and cancel genomics workflows in the Microsoft Genomics service in Azure.
#' 
#' @param api_url_base URL for your Microsoft Genomics service. (Example = `"https://eastus2.microsoftgenomics.net"`)
#' @param subscription_key Subscription key for your Microsoft Genomics service. (Example = "04afabfc1af94c8285faec2f15e4e459")
#'   Go to Azure portal and open your Genomics account page. Under the `Management` heading, choose `Access keys`. There, you find both the API URL and your access keys.
#' @param process_args Process arguments for specifying a reference genome. Select from `"R=b37m1"`, `"R=hg38m1"`, `"R=hg38m1x"`, or `"R=hg19m1"`.
#' @param input_storage_account_name Azure storage account name where input files reside.
#' @param input_storage_account_key Azure storage account key which will be used to create temporary access tokens for input files.
#' @param input_storage_account_container Azure blob container where input files reside.
#' @param blob_name_1 First file name. (Can also be a vector of file names.)
#' @param blob_name_2 Second file name, needed only if input is in the FASTQ format. (Can also be a vector of file names.)
#' @param output_storage_account_name Azure storage account name where output files will be placed.
#' @param output_storage_account_key Azure storage account key which will be used to create a temporary access token for an output container.
#' @param output_storage_account_container Azure blob container where output files will be placed.
#' @param workflow_id Workflow ID returned after submitting a job.
#' 
#' @usage 
#' submit(api_url_base,
#'        subscription_key,
#'        process_args,
#'        input_storage_account_name,
#'        input_storage_account_key,
#'        input_storage_account_container,
#'        blob_name_1,
#'        blob_name_2 = NULL,
#'        output_storage_account_name,
#'        output_storage_account_key,
#'        output_storage_account_container)
#'        
#' list(api_url_base,
#'      subscription_key)
#'           
#' status(api_url_base,
#'        subscription_key,
#'        workflow_id = NULL)
#'           
#' cancel(api_url_base,
#'        subscription_key,
#'        workflow_id = NULL)
#' 
#' @examples 
#' submit(api_url_base = "https://eastus2.microsoftgenomics.net",
#'        subscription_key = "04afabfc...",
#'        process_args = "R=b37m1",
#'        input_storage_account_name = "mygenomicsstorage",
#'        input_storage_account_key= "6GyBAbvgw5sqo2...",
#'        input_storage_account_container = "myinputdata",
#'        blob_name_1 = "NA12878-chr21_1.fq.gz",
#'        blob_name_2 = "NA12878-chr21_2.fq.gz",
#'        output_storage_account_name = "mygenomicsstorage",
#'        output_storage_account_key = "6GyBAbvgw5sqo2...",
#'        output_storage_account_container = "myoutputdata")
#'        
#' list(api_url_base = "https://eastus2.microsoftgenomics.net",
#'      subscription_key = "04afabfc...")
#'      
#' status(api_url_base = "https://eastus2.microsoftgenomics.net",
#'        subscription_key = "04afabfc...",
#'        workflow_id = "12g3c5a...")
#' 
#' cancel(api_url_base = "https://eastus2.microsoftgenomics.net",
#'        subscription_key = "04afabfc...",
#'        workflow_id = "12g3c5a...")
#' 
#' @export submit
#' @export list
#' @export status
#' @export cancel
####################

submit <- function(api_url_base,
                   subscription_key,
                   process_args,
                   input_storage_account_name,
                   input_storage_account_key,
                   input_storage_account_container,
                   blob_name_1,
                   blob_name_2 = NULL,
                   output_storage_account_name,
                   output_storage_account_key,
                   output_storage_account_container){
  
  command <- paste0("msgen submit -u ",
                    api_url_base,
                    " -k ",
                    subscription_key,
                    " -pa ",
                    process_args,
                    " -ia ",
                    input_storage_account_name,
                    " -ik ",
                    input_storage_account_key,
                    " -ic ",
                    input_storage_account_container,
                    " -b1 ",
                    paste(blob_name_1, collapse = " "),
                    if(!is.null("blob_name_2")){paste0( " -b2 ",
                                                        paste(blob_name_2, collapse = " "))},
                   
                    " -oa ",
                    output_storage_account_name,
                    " -ok ",
                    output_storage_account_key,
                    " -oc ",
                    output_storage_account_container)
  
  ## Invoke System Command
  if (.Platform$OS.type == "windows"){
    system2(command,
           invisible = FALSE)
  } else{
    system2(command)
  }
  
}


list <- function(api_url_base,
                 subscription_key){
  
  command <- paste0("msgen list -u ",
                    api_url_base,
                    " -k ",
                    subscription_key)
  
  ## Invoke System Command
  if (.Platform$OS.type == "windows"){
    system2(command,
            invisible = FALSE)
  } else{
    system2(command)
  }
  
}


status <- function(api_url_base,
                   subscription_key,
                   workflow_id = NULL){
  
  command <- paste0("msgen status -u ",
                    api_url_base,
                    " -k ",
                    subscription_key,
                    if(!is.null("workflow_id")){paste0(" -w ",
                                                       workflow_id)}
                    )
  
  
  ## Invoke System Command
  if (.Platform$OS.type == "windows"){
    system2(command,
            invisible = FALSE)
  } else{
    system2(command)
  }
  
}


cancel <- function(api_url_base,
                   subscription_key,
                   workflow_id){
  
  command <- paste0("msgen cancel -u ",
                    api_url_base,
                    " -k ",
                    subscription_key,
                    " -w ",
                    workflow_id)
  
  ## Invoke System Command
  if (.Platform$OS.type == "windows"){
    system2(command,
            invisible = FALSE)
  } else{
    system2(command)
  }
  
}