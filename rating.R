library(ggplot2)
library(dplyr)
library(magrittr)
library(readr)
library(stringi)

rating <- function(cName, data){
  
# data <- read_csv("GitHub/bidwatch/data/all_contracts_test.csv")
# cName <- "INTERNATIONAL ROAD DYNAMICS INC"

  #Pull Data
  
  nameMatrix <- data$recipient_name
  totalDO <- data$total_dollars_obligated
  currentTVoA <- data$current_total_value_of_award
  potentialTVoA <- data$potential_total_value_of_award
  startDate <- data$period_of_performance_start_date
  currentEndDate <- data$period_of_performance_current_end_date
  lastEndDate <- data$period_of_performance_potential_end_date
  stateHQ <- data$recipient_state_code #needs to be changed to numbers
  biddingProcess <- data$extent_competed #needs to be changed to numbers
  pricingDataProvided <- data$cost_or_pricing_data #needs to be changed to numbers
  undefinitized <- data$undefinitized_action #needs to be changed to numbers
  
  # #Convert Dates to Numbers
  # startDateYear <- 0
  # startDateMonth <- 0
  # for (i in 1:length(startDate)) {
  #   if (stri_length(startDate[i]) == 13) {
  #     startDateYear[i] <- substring(startDate[i],7,8)
  #     startDateMonth[i] <- substring(startDate[i],3,4)}
  #   else {
  #     startDateYear[i] <- substring(startDate[i],9,10)
  #   } }
  # startDateYear[startDateYear == "8 "] <- "18"
  # startDateYear[startDateYear == "9 "] <- "19"
  # 
  # currentEndDateYear <- 0
  # for (i in 1:length(currentEndDate)) {
  #   if (stri_length(currentEndDate[i]) == 13) {
  #     currentEndDateYear[i] <- substring(currentEndDate[i],7,8)}
  #   else {
  #     currentEndDateYear[i] <- substring(currentEndDate[i],9,10)
  #   } }
  # currentEndDateYear[currentEndDateYear == "8 "] <- "18"
  # currentEndDateYear[currentEndDateYear == "9 "] <- "19"
  # 
  #Function Coefficients
  coeff1 <- 30
  coeff2 <- 30
  coeff3 <- 25
  coeff4 <- 15
  coeff5 <- 0
  coeff6 <- 0
  for (i in 1:length(pricingDataProvided)) {
    coeff5[i] <- ifelse(pricingDataProvided[i]=="YES", 0, 10)
  }
  coeff5[is.na(coeff5)] = 10
  for (i in 1:length(undefinitized)) {
    coeff6[i] <- ifelse(undefinitized[i]=="NO", 0, 10)
  }
  coeff6[is.na(coeff6)] = 10
  
#Find % for budget and schedule items
    pOverBudget <- 0
    pOverTotalBudget <- 0
    dOverSchedule <- 0
    dOverTotalSchedule <- 0   
  
  for (i in 1:length(totalDO)) {
    pOverBudget[i] <- (currentTVoA[i] - totalDO[i])/(totalDO[i])
    pOverTotalBudget[i] <- (currentTVoA[i] - potentialTVoA[i])/(potentialTVoA)
    # dOverSchedule <-
    # dOverTotalSchedule <-   
}
    pOverBudget[is.nan(pOverBudget)] = 0
    pOverBudget[is.infinite(pOverBudget)] = 0
    pOverBudget[pOverBudget > 1] <- 1 
    pOverTotalBudget[is.nan(pOverTotalBudget)] = 0
    pOverTotalBudget[is.infinite(pOverTotalBudget)] = 0
    pOverTotalBudget[pOverTotalBudget < 0] <- 0

    score <- 0
    for (i in 1:length(totalDO)) {
      score[i] <- 100 - (coeff1*pOverBudget[i]) - (coeff2*pOverTotalBudget[i]) - (coeff5[i])-(coeff6[i])
    
      }
    
    locations <- match(c(cName),nameMatrix)
    
     return(score[locations])
      
 }
rating("INTERNATIONAL ROAD DYNAMICS INC","data/all_contracts_prime_transactions_1.csv")