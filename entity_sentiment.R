library(googleLanguageR)
library(tidyverse)
library(stringr)
library(rvest)

gl_auth("Bidwatch-b4423aaa898e.json")

num_articles = 10
article_nodes <- read_delim('article_nodes.csv', delim=";")

get_node <- function(url){
  node = article_nodes[str_detect(url, article_nodes$URL),]$node
  if (length(node)>0) {
    return(node)
  }
  return("")
}

search_articles <- function(search_term){
  base_URL = "https://www.google.com/search?biw=1234&bih=698&tbm=nws&ei=vI5oXKT8Icqe0gLqmrDQCw&q="
  query = paste(base_URL, search_term, sep="")
  #Reading the HTML code from the website
  webpage <- read_html(query)
  rank_data_html <- html_nodes(webpage,'h3 a')
  
  #Converting the ranking data to text
  rank_data <- html_attr(rank_data_html, "href")
  
  clean_links <- map(rank_data, function(x){substr(x,8,nchar(x))})
  #Let's have a look at the rankings
  articles <- map(head(clean_links,num_articles), read_article)
}

read_article <- function(url) {
  print('READING ')
  print(url)
  node <- get_node(url)
  print(paste(node))
  
  if (node != ""){
    #print('Passed')
    try(read_html(url) %>%
        #return())
        html_nodes(.,node) %>%
        #html_nodes(., ".article-content p") %>%
        html_text(.) %>%
        paste(., collapse=" ") %>%
        return(.))
  }
  else{
    return(" ")
  }
}

score_entities <- function(entities){
  entities %>%
    subset(type %in% c('PERSON', 'ORGANIZATION', 'LOCATION')) %>%
    #subset(score != 0.0) %>%
    subset(name == str_to_title(name)) %>%
    subset(mention_type != "COMMON") %>%
    #subset(magnitude != 0.0) %>%
    group_by(name, type) %>%
    summarise(mean_score = mean(score),
              mean_magnitude = mean(magnitude),
              mean_product = mean(score*magnitude),
              wikipedia_url = head(wikipedia_url,1),
              max_saliency = max(salience)) %>%
    subset(max_saliency > 0.002)
    #nest(-name) %>%
    #mutate(Quantiles = map(data, ~ quantile(.$score)),
    #       Quantiles = map(Quantiles, ~ bind_rows(.) %>% gather()))%>% 
    #unnest(Quantiles)
}


get_entities <- function(company){
  company <- paste(gsub(" ","+", company),'scandal',sep='+')
  # Do Google search for company related news
  articles <- search_articles(company)
  
  # Push into google_nlp
  #nlp_result <- gl_nlp(articles)
  nlp_result <- map(articles, try(
    function(x) {
      x<-str_replace_all(x, "[^[:alnum:]]", " ")
      #print(x)
      if ((length(x)>0) &&
         (nchar(x)>400)){
        if (nchar(x)<60000){
          gl_nlp(x)[['entities']][[1]]
        }
      }
    }
  ))

  entities <- bind_rows(map(nlp_result, function(x){data.frame(x)}))
  # Get entities
  #print(nlp_result)
  #entities <- rbind(list(nlp_result[['entities']]))
  #return(entities)
  # Summarise entity sentiments
  return(list("entities"=entities,"articles"=articles))
  #return(entities)
}

check_connection <- function(name1, name2, text) {
  l1 <- map(text, function(x){grepl(tail(unlist(strsplit(name1, ' ')),1), x)})
  l2 <- map(text, function(x){grepl(tail(unlist(strsplit(name2, ' ')),1), x)})
  result <- 0
  for (i in 1:length(l1)){
    if (l1[[i]] & l2[[i]]){
      result <- result + 1
    }
  }
  l1 <- map(tail(text,length(text)-1), function(x){grepl(tail(strsplit(name1, ' '),1), x)})
  l2 <- map(head(text,length(text)-1), function(x){grepl(tail(strsplit(name2, ' '),1), x)})
  for (i in 1:(length(l1)-1)){
    if (l1[[i]] & l2[[i]]){
      result <- result + 1
    }
  }
  return(result)
}
