library(shiny)


info_card <- function(entity){
  return(
    HTML(paste(c("<b>",entity[['name']],"</b>",
                 entity[['title']],
                 entity[['description']]),
               sep="<br/>"))
    )
}