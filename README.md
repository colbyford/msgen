
# *msgen* - R functions for interfacing with the Microsoft Genomics service in Azure
<h3 align = "right">Colby T. Ford, Ph.D.</h3>
<img align="right" src="https://raw.githubusercontent.com/colbyford/msgen/master/img/msgen_hex.png" alt="msgen icon" width="200">

## Description

The Microsoft Genomics service in Azure can power genome sequencing using a cloud implementation of the Burrows-Wheeler Aligner (BWA) and the Genome Analysis Toolkit (GATK) for secondary analysis. The pipeline can take in multiple FASTQ and BAM files and provides alignment and variant outputs. The `msgen` package provides an interface to use the service from within R.

## Installation

You can install the latest stable version from GitHub using the following command:
```r
library(devtools)
install_github("colbyford/msgen")
library(msgen)
```
*Note: You must have Python 2.7 (2.7.12 is recommended) installed.*

## Usage

```r
# Install the `msgen` Python (Only needs to be run once if you don't already have the library installed.)
install_msgen(method = "pip") #or "easy_install", "conda", or "setup.py"

# Submit a job
submit(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc...",
       process_args = "R=b37m1",
       input_storage_account_name = "mygenomicsstorage",
       input_storage_account_key= "6GyBAbvgw5sqo2...",
       input_storage_account_container = "myinputdata",
       blob_name_1 = "NA12878-chr21_1.fq.gz",
       blob_name_2 = "NA12878-chr21_2.fq.gz",
       output_storage_account_name = "mygenomicsstorage",
       output_storage_account_key = "6GyBAbvgw5sqo2...",
       output_storage_account_container = "myoutputdata")

# List all your jobs       
list(api_url_base = "https://eastus2.microsoftgenomics.net",
     subscription_key = "04afabfc...")

# Check the status of your jobs     
status(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc...",
       workflow_id = "12g3c5a...")

# Cancel a job
cancel(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc...",
       workflow_id = "12g3c5a...")

```

## To Do

- [x] Configure `install_msgen` function
	- [ ] Test installation options
- [x] Create `submit` function
	- [ ] Test `submit` function
	- [ ] Add functionality for `config.txt` usage
- [x] Create `list` function
	- [ ] Test `list` function
	- [ ] Add functionality for `config.txt` usage
- [x] Create `status` function
	- [ ] Test `status` function
	- [ ] Add functionality for `config.txt` usage
- [x] Create `cancel` function
	- [ ] Test `cancel` function
	- [ ] Add functionality for `config.txt` usage


## Links

- [__msgen__ Python command-line client](https://github.com/MicrosoftGenomics/msgen)
- [Microsoft Genomics service on Azure](https://azure.microsoft.com/en-us/services/genomics/)
- [Microsoft Genomics Documentation](https://docs.microsoft.com/en-us/azure/genomics/)


## License

This package/project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

*Note: The Microsoft Genomics service, Azure, and the `msgen` Python command-line interface are all Copyright (c) Microsoft Corporation. All rights reserved.*
