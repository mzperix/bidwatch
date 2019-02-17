library(ggplot2)
library(dplyr)
library(magrittr)
library(readr)

colors <- c("blue"="#005468",
            #"grass"="#02B644",
            "green"="#02B644",
            "yellow"="#C1E000",
            "white"="#FFFFFF")

style <- theme_classic()

plot1 <- function()
{
  data <- read_csv("data/all_contracts_prime_transactions_1.csv")
  #data <- data[1:5, ]
  
  data %>%
    group_by(parent_award_agency_name) %>%
    summarise(mean_total_value = mean(current_total_value_of_award)) %>%
    ggplot(aes(x=parent_award_agency_name,
               y = mean_total_value,
               fill = parent_award_agency_name)) +
    geom_bar(stat='identity') +
    xlab('Agency') +
    ylab('Mean total value of award') +
    style + 
    theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
    scale_fill_manual(values=c(colors[["blue"]],
                 colors[["yellow"]],
                 colors[["green"]],
                 colors[["blue"]],
                 colors[["yellow"]],
                 colors[["green"]],
                 colors[["blue"]],
                 colors[["yellow"]],
                 colors[["green"]])) 
}

plot1()