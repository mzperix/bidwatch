
library(ggnet)
library(network)
library(sna)
library(RecordLinkage)
library(png)
source('entity_sentiment.R')

graph_plot <- function(entities, articles){
  sentences <- unlist(strsplit(unlist(articles), "[.]", perl=T))
  scores <- score_entities(entities) %>%
    subset(type != "LOCATION")
  
  n_nodes <- scores %>%
    nrow()
  
  net_matrix <- matrix(0L, nrow = n_nodes, ncol=n_nodes)
  id_central <- which.min(levenshteinSim(search_term, scores$name))
  net_matrix[id_central,] <- 1L
  net_matrix[,id_central] <- 1L
  for (i in 1:(n_nodes-1)){
    for (j in 1:i){
      net_matrix[i,j] <- check_connection(scores$name[i],scores$name[j],sentences)
      net_matrix[j,i] <- net_matrix[i,j]
    }
  }
  #net_matrix[id_central,] <- 1
  #net_matrix[,id_central] <- 1L
  irrelevant_ids <- which(rowSums(net_matrix)==0)
  net_matrix <- net_matrix[-irrelevant_ids,-irrelevant_ids]
  scores <- scores[-irrelevant_ids,]
  net = network(net_matrix,label = scores$name, directed = FALSE)
  # vertex names
  network.vertex.names(net) = scores$name
  
  img <- readPNG("www/imgHover1.png")
  wat <- ggnet2(net, label=FALSE, edge.size=2) 
      
  df <- data.frame(wat$data) %>%
    #mutate(name=label) %>%
    merge(.,scores, by.x="label", by.y="name")
  
  img_org <- readPNG("www/organization.png")
  img_person <- readPNG("www/person.png")
  xsize <- 0.05
  ysize <- 0.05
  extra <- apply(df, 1, function(row){
      x = as.numeric(row['x'])
      y = as.numeric(row['y'])
      if (row['type'] == 'ORGANIZATION') {layer <- annotation_raster(img_org, xmin=x-xsize, xmax=x+xsize, ymin=y-ysize, ymax=y+ysize)}
      else {layer <- annotation_raster(img_person, xmin=x-xsize, xmax=x+xsize, ymin=y-ysize, ymax=y+ysize)}
      return(layer)
      })   
  #names <- df %>%
    #geom_text(aes(x=x, y=y-ysize, label=label))
  return(wat+extra+geom_text(aes(x=x, y=y-ysize/2, label=label)))
}

