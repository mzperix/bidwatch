# Entity info card
library(httr)
api_key <- fromJSON('info_card_api_key.json')

get_entity_info <- function(search_term){
    call <- paste("https://kgsearch.googleapis.com/v1/entities:search?query=",search_term,"&key=",api_key,"&limit=1&indent=True",
                 sep="")
    entity<-fromJSON(call)
    if (length(entity$itemListElement)>0){
        result <- c("name"=entity$itemListElement[[1]]$result$name,
                    "title"=entity$itemListElement[[1]]$result$description)
        try(result[['description']]<-entity$itemListElement[[1]]$result$detailedDescription[['articleBody']])
    }
    else{
        result <- c("name"=gsub("+", " ", search_term),
                    "title"=" ",
                    "description"=" ")
    }
    return(result)
}