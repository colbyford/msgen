#' @title Install Python Libraries
#' @description Install msgen and Azure Storage Python Libraries.
#' 
#' @import reticulate
#' @export install_msgen
####################

install_msgen <- function(method = "pip"){
  os <- .Platform$OS.type
  if (os == "windows"){
    if (method == "pip"){
      system("pip install --upgrade --no-deps msgen")
      system("pip install msgen")
    } else if (method == "easy_install"){
      system("easy_install msgen")
    } else if (method == "conda"){
      system("conda install msgen")
    } else if (method == "setup.py"){
      reticulate::py_run_file("src/setup.py")
    }  else{
      cat("Methods supported: `setup.py`, `pip`,`easy_install`, and `conda`.")
    }
  } else if (os == "unix"){
    if (method == "pip"){
      system("sudo apt-get install -y build-essential libssl-dev libffi-dev libpython-dev python-dev python-pip")
      system("sudo pip install --upgrade --no-deps msgen")
      system("sudo pip install msgen")
    } else if (method == "easy_install"){
      system("sudo easy_install msgen")
    } else if (method == "conda"){
      system("sudo conda install msgen")
    } else if (method == "setup.py"){
      reticulate::py_run_file("src/setup.py")
    } else{
      cat("Methods supported: `setup.py`, `pip`,`easy_install`, and `conda`.")
    }
  }
}
