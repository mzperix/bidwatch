library(shiny)


info_card <- function(entity){
  return(
    HTML(paste('<div class="entity"><p class="entityName">',
                  entity[['name']],'</p><p class="entityTitle">', 
                  entity[['title']],'</p><p class="entityDescription">',
                  entity[['description']]),'</p></div>')
    )
}