
# *msgen* - R functions for interfacing with the Microsoft Genomics service in Azure
<h3 align = "right">Colby T. Ford, Ph.D.</h3>
<img align="right" src="https://raw.githubusercontent.com/colbyford/msgen/master/img/msgen_hex.png" alt="msgen icon" width="200">

## Description

The Microsoft Genomics service in Azure can power genome sequencing using a cloud implementation of the Burrows-Wheeler Aligner (BWA) and the Genome Analysis Toolkit (GATK) for secondary analysis. The pipeline can take in multiple FASTQ and BAM files and provides alignment and variant outputs.

## Installation

You can install the latest stable version from GitHub using the following command:
```r
library(devtools)
install_github("colbyford/msgen")
library(msgen)
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
