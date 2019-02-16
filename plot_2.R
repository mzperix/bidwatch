library(ggplot2)
library(dplyr)
library(magrittr)
library(readr)

plot2 <- function()
{
  data <- read_csv("data/all_contracts_prime_transactions_1.csv")
  #data <- data[1:5, ]
  
  data %>%
    group_by(parent_award_agency_name) %>%
    summarise(mean_total_value = mean(current_total_value_of_award)) %>%
    ggplot(aes(x=parent_award_agency_name,
               y = mean_total_value)) +
    geom_bar(stat='identity') +
    xlab('Agency') +
    ylab('Mean total value of award') +
    theme(axis.text.x = element_text(angle = 90, hjust = 1))
}

