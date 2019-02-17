library(shiny)


info_card <- function(entity){
  return(
    HTML(paste(c("<div class='entityName'>",entity[['name']],"</div>",
                 entity[['title']],
                 entity[['description']]),
               sep="<br/>"))
    )
}