library(ggplot2)
library(dplyr)
library(magrittr)
library(readr)
library(stringi)

# numContracts <- function(cName,data){
 
  cName <- "INTERNATIONAL ROAD DYNAMICS INC"
  data <- read_csv("GitHub/bidwatch/data/all_contracts_test.csv")

  matrix1 <- data$recipient_name
  contractsNumber <- length(grep(cName, data))
#   # return(contractsNumber)  
#    
# # }