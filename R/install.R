#' @title Install Python Libraries
#' @description Install msgen and Azure Storage Python Libraries.
#' 
#' @param method Method by which to install the msgen library.
#' (Choose from either "setup.py", "pip", "easy_install", or "conda".)
#' @param version Python version under which the package should be installed.
#' (Note: must be a version of Python 2 such as 2.7.)
#' 
#' @usage install_msgen(method = "pip", version = 2.7)
#' 
#' @import reticulate
#' @export install_msgen
####################

install_msgen <- function(method = "pip", version = NULL){
  if (!reticulate::py_module_available("msgen")){
    os <- .Platform$OS.type
    if (os == "windows"){
      if (method == "pip"){
        #system("pip install --upgrade --no-deps msgen")
        if (is.null(version)){
          command <- paste0("pip install msgen",
                            sep = "")
        } else{
          command <- paste0("pip-",
                            version,
                            " install msgen",
                            sep = "")
        }
        
        system(command)
      } else if (method == "easy_install"){
        system("easy_install msgen")
      } else if (method == "conda"){
        system("conda install msgen")
      } else if (method == "setup.py"){
        reticulate::py_run_file("python/setup.py")
      }  else{
        cat("Methods supported: `setup.py`, `pip`,`easy_install`, and `conda`.")
      }
    } else if (os == "unix"){
      if (method == "pip"){
        #system("sudo apt-get install -y build-essential libssl-dev libffi-dev libpython-dev python-dev python-pip")
        #system("sudo pip install --upgrade --no-deps msgen")
        command <- paste0("sudo pip-",
                          version,
                          " install msgen",
                          sep = "")
        system(command)
      } else if (method == "easy_install"){
        system("sudo easy_install msgen")
      } else if (method == "conda"){
        system("sudo conda install msgen")
      } else if (method == "setup.py"){
        reticulate::py_run_file("python/setup.py")
      } else{
        cat("Methods supported: `setup.py`, `pip`,`easy_install`, and `conda`.\n")
      }
    }
  } else{
    cat("`msgen` is already installed.\n")
  }
  
}
