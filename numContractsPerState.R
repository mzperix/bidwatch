 numContractsPerState <- function(cName,data){
  
  

  # cName <- "INTERNATIONAL ROAD DYNAMICS INC"
  # data <- read_csv("GitHub/bidwatch/data/all_contracts_test.csv")
  
  matrix1 <- data$recipient_name
  matrix2 <- data$primary_place_of_performance_state_name
  locate <- (grep(cName, matrix1))
  states<-0
  for (i in 1:length(locate)) {
    states[i] <- matrix2[locate[i]]
  }
  states[is.na(states)] = "INTERNATIONAL"
  
  stateTable <- as.data.frame(table(states))
  
  # Pie Chart with Percentages
  slices <- c(stateTable[,2])
  lbls <- c(stateTable[,1])
  pct <- round(slices/sum(slices)*100)
  lbls <- paste(pct) # add percents to labels 
  lbls <- paste(lbls,"%",sep="") # ad % to labels 
  pie(slices, labels = lbls, col=rainbow(length(lbls)),
      main="Location of Awarded Contracts")
  
return(perState)
}