#' @title Interact with the Microsoft Genomics service in Azure
#' 
#' @description Submit, list, check the status, and cancel genomics workflows in the Microsoft Genomics service in Azure.
#' 
#' @param path_to_config Path character string to config file.
#' @param task Task for the msgen system to invoke.
#' (Choose from "submit", "list", "status", or "cancel".)
#' 
#' @usage 
#' submit(path_to_config, task)
#' 
#' @examples 
#' submit(path_to_config = "/files/submission.config, task = "list")
#' 
#' @import readr
#' @import dplyr
#' @import tidyr
#' @export use_config
####################

use_config <- function(path_to_config, task = "list"){
  
  ## Parse Config File
  #path_to_config <- "test/sample.config"
  config <- readr::read_table(path_to_config, col_names = FALSE, comment = "#") %>% 
    na.omit() %>% 
    tidyr::separate(1, c("param", "value"), sep = ": ") ## To-Do: Implement Regex (\:\s+) instead of colon space 
  
  rownames(config) <- config$param
  
  ## Dynamically assign parameters as variables
  for (i in 1:nrow(config)){
    assign(as.character(config[i,1]),as.character(config[i,2]))
  }
  
  if (task == "submit"){
    
    requiredparams <- c("api_url_base",
                        "subscription_key",
                        "process_args",
                        "input_storage_account_name",
                        "input_storage_account_key",
                        "input_storage_account_container",
                        "blob_name_1",
                        "output_storage_account_name",
                        "output_storage_account_key",
                        "output_storage_account_container")
    
  } else if (task %in% c("list", "status")){
    
    requiredparams <- c("api_url_base",
                        "subscription_key")
    
  } else if (task == "cancel"){
    requiredparams <- c("api_url_base",
                        "subscription_key",
                        "workflow_id")
  } else{
    cat("ERROR: `task` must be submit, list, status, or cancel.\n")
  }
  
  

}