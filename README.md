
# *msgen* - R functions for interfacing with the Microsoft Genomics service in Azure
<h3 align = "right">Colby T. Ford, Ph.D.</h3>
<img align="right" src="https://raw.githubusercontent.com/colbyford/msgen/master/img/msgen_hex.png" alt="msgen icon" width="200">

## Description

The Microsoft Genomics service in Azure can power genome sequencing using a cloud implementation of the Burrows-Wheeler Aligner (BWA) and the Genome Analysis Toolkit (GATK) for secondary analysis. The pipeline can take in multiple FASTQ and BAM files and provides alignment and variant outputs. The `msgen` package provides an interface to use the service from within R.

## R Package Installation

You can install the latest stable version from GitHub using the following command:
```r
library(devtools)
install_github("colbyford/msgen")
library(msgen)
```
*Note: You must have Python 2.7 (2.7.12 is recommended) installed.*

## Setup

### *Method 1:* Install the `msgen` CLI (Python library) from within R
```r
# Attempt to install from within R
# (Only needs to be run once if you don't already have the Python library installed.)
install_msgen(path = "/usr/bin/python2.7")
```
*Note: Due to the vast differences in Python configurations and system permissions, the above function may not work in all scenarios. If not, you will need to install the `msgen` Python library (using pip, pypi, conda, etc.) in your Python 2.x environment.*

### *Method 2:* Install the `msgen` CLI (Python library) from the Terminal
```bash
sudo python2.7 -m pip install msgen
```

## Usage
### Submit a job
```r
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
```

### List all your jobs 
```r
list(api_url_base = "https://eastus2.microsoftgenomics.net",
     subscription_key = "04afabfc...")
```

### Check the status of your jobs
```r
status(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc...",
       workflow_id = "12g3c5a...")
```

### Cancel a job
```r
cancel(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc...",
       workflow_id = "12g3c5a...")
```

## To Do
- [ ] Test all functions.
- [ ] Add in the capability to use config files.
- [ ] Add in functionality for uploading/downloading files to/from blob storage.

## Links

- [__msgen__ Python command-line client](https://github.com/MicrosoftGenomics/msgen)
- [Microsoft Genomics service on Azure](https://azure.microsoft.com/en-us/services/genomics/)
- [Microsoft Genomics Documentation](https://docs.microsoft.com/en-us/azure/genomics/)


## License

This package/project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

*Note: The Microsoft Genomics service, Azure, and the `msgen` Python command-line interface are all Copyright (c) Microsoft Corporation. All rights reserved.*
