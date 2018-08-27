## Test submission functionality

api_url_base <- "https://eastus2.microsoftgenomics.net"
subscription_key <- "04afabfc1af94c8285faec2f15e4e459"
process_args <- "R=b37m1"
input_storage_account_name <- "cfgenomics"
input_storage_account_key <- "6GyBAbvgw5sqo2xZ1ex5JSda82nu1/edfDvyAcvFSBE9oixUniajPfumB6hfQgs2ArYzt/8I/Sj+F+u9q3B0mA=="
input_storage_account_container <- "myinputdata"
blob_name_1 <- "NA12878-chr21_1.fq.gz"
blob_name_2 <- "NA12878-chr21_2.fq.gz"
output_storage_account_name <- "cfgenomics"
output_storage_account_key <- "6GyBAbvgw5sqo2xZ1ex5JSda82nu1/edfDvyAcvFSBE9oixUniajPfumB6hfQgs2ArYzt/8I/Sj+F+u9q3B0mA=="
output_storage_account_container <- "myoutputdata"

submit(api_url_base,
       subscription_key,
       process_args,
       input_storage_account_name,
       input_storage_account_key,
       input_storage_account_container,
       blob_name_1,
       blob_name_2,
       output_storage_account_name,
       output_storage_account_key,
       output_storage_account_container)


submit(api_url_base = "https://eastus2.microsoftgenomics.net",
       subscription_key = "04afabfc1af94c8285faec2f15e4e459",
       process_args = "R=b37m1",
       input_storage_account_name = "mygenomicsstorage",
       input_storage_account_key= "6GyBAbvgw5sqo2xZ1ex5JSda82nu1/edfDvyAcvFSBE9oixUniajPfumB6hfQgs2ArYzt/8I/Sj+F+u9q3B0mA==",
       input_storage_account_container = "myinputdata",
       blob_name_1 = "NA12878-chr21_1.fq.gz",
       blob_name_2 = "NA12878-chr21_2.fq.gz",
       output_storage_account_name = "mygenomicsstorage",
       output_storage_account_key = "6GyBAbvgw5sqo2xZ1ex5JSda82nu1/edfDvyAcvFSBE9oixUniajPfumB6hfQgs2ArYzt/8I/Sj+F+u9q3B0mA==",
       output_storage_account_container = "myoutputdata")