
# *msgen* - R functions for interfacing with the Microsoft Genomics service in Azure
<h3 align = "right">Colby T. Ford, Ph.D.</h3>
<img align="right" src="https://raw.githubusercontent.com/colbyford/msgen/master/img/msgen_hex.png" alt="msgen icon" width="200">

## Description

The Microsoft Genomics service in Azure can power genome sequencing using a cloud implementation of the Burrows-Wheeler Aligner (BWA) and the Genome Analysis Toolkit (GATK) for secondary analysis. The pipeline can take in multiple FASTQ and BAM files and provides alignment and variant outputs. The `msgen` package provides an interface to use the service from within R.

---
<img align="center" src="https://raw.githubusercontent.com/colbyford/msgen/master/img/msgen_workflow.png" alt="msgen workflow">

## R Package Installation

You can install the latest stable version from GitHub using the following command:
```r
remotes::install_github("colbyford/msgen")
library(msgen)
```

## Usage
### Submit a workflow
```r
submit_workflow(subscription_key = "04afabfc...",
                region = "eastus",
                process = "snapgatk",
                reference = "b37m1",
                input_storage_account_name = "mygenomicsstorage",
                input_storage_account_key= "6GyBAbvgw5sqo2...",
                input_container_name = "myinputdata",
                blob_name_1 = "NA12878-chr21_1.fq.gz",
                blob_name_2 = "NA12878-chr21_2.fq.gz",
                output_container_name = "myoutputdata")
```

### List all your workflows 
```r
list_workflows(subscription_key = "04afabfc...",
               region = "eastus")
```

### Check the status of your workflow
```r
get_workflow_status(subscription_key = "04afabfc...",
                    region = "eastus",
                    workflow_id = "12g3c5a...")
```

### Cancel a workflow
```r
cancel_workflow(subscription_key = "04afabfc...",
                region = "eastus",
                workflow_id = "12g3c5a...")
```


## Links

- [__msgen__ Python command-line client](https://github.com/microsoft/msgen)
- [Microsoft Genomics service on Azure](https://azure.microsoft.com/en-us/services/genomics/)
- [Microsoft Genomics Documentation](https://docs.microsoft.com/en-us/azure/genomics/)


## License

This open source R package/project is licensed under the Apache 2.0 License - see the [LICENSE](LICENSE) file for details

*Note: The Microsoft Genomics service, Azure, and the `msgen` Python command-line interface are all Copyright (c) Microsoft Corporation. All rights reserved.*
