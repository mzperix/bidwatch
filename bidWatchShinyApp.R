library(shiny)
library(r2d3)
library(RJSONIO)
source('first_plot.R')
source('plot_2.R')
source('info_card.R')
source('get_entity_info.R')
source('graph_plot.R')


load('entities.RData')
load('articles.RData')

search_term <- 'whitefish+energy+holding'
whitefish_holding <-get_entity_info(search_term)

data_ready <- FALSE

ui <- fluidPage(
  theme = "styles.css",
  tags$script(src = "main.js"),
  
  #header
  tags$div(id = "divBanner",
           tags$img(src="banner.png", width = 1440, id = "imgBanner")),
  
  
  #main window
  
  tags$div(id = "divMain",
           h1("Why watch bids?", id = "h1_Bids"),
           #tags$img(src="linebreak.png", id = "imgLine"),
           tags$img(src="quote_1.png", id = "imgQuote_1"),
           tags$img(src="quote_2.png", id = "imgQuote_2"),
           tags$img(src="linebreak.png", id = "imgLine"),
           
           h1("Do your own search!", id = "h1_Search"),
           #textInput(inputId="mainSearch", label = "", value = "search for a company, a person, an agency, or a city"),
           
           #tags$img(src="network_1.png", height = 500, id = "imgNetwork_1"),
           #tags$div(id = "divImg1", tags$img(src="imgHover1.png", id = "imgHover_1"))#,
           #tags$div(id = "divImg2"),
           #tags$div(id = "divImg3"),
           #tags$div(id = "divImg4"),
           #tags$div(id = "divImg5"),
           #tags$div(id = "divImg6"),
           #tags$div(id = "divImg7"),
           #tags$div(id = "divImg8"),
           #tags$div(id = "divImg9"),
           #tags$div(id = "divImg10"),
           #tags$div(id = "divImg11")
           
  
  
  textInput(inputId="mainSearch", value = "search corrupt bids", label = "", placeholder = NULL),
  actionButton("searchBtn", "SEARCH"),
  
  fluidRow(column(7, div(style = "height:700px;", plotOutput("plot2", height="600px", width="700px", hover="plot_hover"))), 
           column(2, align="center", div(id='info_card', htmlOutput("info_card")))

),

tags$div(id = "divDetail",
         tags$img(src="linebreak.png", id = "imgLine"),
         tags$div(id = "divCoin",
                  tags$p(id = "idCoinTitle", "COIN Score", class = "detailCorpTitle"),
                  tags$p(id = "idCoinScore", "87", class = "detailCorpDetail")),
         tags$div(id = "divData1",
                  tags$p(id = "idData1Title", "Number of Contracts", class = "detailCorpTitle"),
                  tags$p(id = "idData1", "22", class = "detailCorpDetail")),
         tags$div(id = "divData2",
                  tags$p(id = "idData2Title", "Overexpenditured", class = "detailCorpTitle"),
                  tags$p(id = "idData2", "4", class = "detailCorpDetail")))
  )

)

server <- function(input, output) {
  plot_is_ready <- FALSE
  search_term <- 'whitefish+energy'
  observeEvent(input$searchBtn, {
      data_ready <- FALSE
      plot_is_ready <- TRUE
      withProgress(message = 'Searching for information', value = 0.5, {
        search_results <- get_entities(input$mainSearch)
      })
      entities <- search_results[['entities']]
      articles <- search_results[['articles']]
      #print(articles)
      withProgress(message = 'Making plot', value = 1, {
        result <- graph_plot(entities, articles)
      })
      
      output$plot2 <- renderPlot({
        result[['plot']]
      }) 
      
      #print(result[['data']])
      #plot_data <- result[['data']]
      #for (i in 1:length(plot_data$label)){
      #  entity_info <- try(get_entity_info(gsub(' ', '+', x['label'])))
      #  plot_data[i,'name']<-entity_info['name']
      #  plot_data[i,'title']<-entity_info['title']
      #  plot_data[i,'description']<-entity_info['description']
      #}
      #data_ready <- TRUE
      plot_is_ready <- TRUE
      #output$info_card <- renderUI({
      #  hoverId <- 1
      #  return(info_card(result[['data']][hoverId,]))
      #})
      #hover_search_term<-"whitefish+energy"
      output$info_card <- renderUI({
        if (plot_is_ready){
          hover_search_term<-"whitefish+energy"
          #hover_search_term<-"ryan+zinke"
          info_card(get_entity_info(hover_search_term))
        }
      }) 
  })
  
  output$info_card <- renderUI({
    if (plot_is_ready){
      hover_search_term<-"whitefish+energy"
      #hover_search_term<-"ryan+zinke"
      info_card(get_entity_info(hover_search_term))
    }
  }) 
}

shinyApp(ui = ui, server = server)