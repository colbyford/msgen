#' @title Install Python Libraries
#' @description Install msgen and Azure Storage Python Libraries.
#' 
#' @param path Path to Python version under which the package should be installed.
#' Must be character string of the path to the version (e.g. "/usr/bin/python2.7")
#' (Note: must be a version of Python 2 such as 2.7)
#' 
#' @usage install_msgen(method = "pip", version = "python2.7")
#' 
#' @import reticulate
#' @export install_msgen
####################

install_msgen <- function(path = "/usr/bin/python2.7"){
  if (!reticulate::py_module_available("msgen")){
    # To-do: Add tryCatch()
    reticulate::use_python(path, required = TRUE)
    reticulate::conda_install("msgen")
  } else{
    cat("`msgen` is already installed.\n")
  }
  
}
