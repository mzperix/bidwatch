library(shiny)
library(r2d3)
library(RJSONIO)
source('first_plot.R')
source('plot_2.R')
source('info_card.R')
source('get_entity_info.R')

load('entities.RData')
load('articles.RData')

ui <- fluidPage(
  theme = "styles.css",
  tags$script(src = "main.js"),
  
  #header
  tags$div(id = "divBanner",
           tags$img(src="banner.jpg", width = 1440, id = "imgBanner")),
  
  
  #main window
  
  tags$div(id = "divMain",
           h1("Why watch bids?", id = "h1_Bids"),
           #tags$img(src="linebreak.png", id = "imgLine"),
           tags$img(src="quote_1.png", id = "imgQuote_1"),
           tags$img(src="quote_2.png", id = "imgQuote_2"),
           tags$img(src="linebreak.png", id = "imgLine"),
           
           h1("Do your own search!", id = "h1_Search"),
           textInput(inputId="mainSearch", label = "", value = "search for a company, a person, an agency, or a city"),
           
           tags$img(src="network_1.png", height = 500, id = "imgNetwork_1"),
           tags$div(id = "divImg1", tags$img(src="imgHover1.png", id = "imgHover_1"))#,
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
           
  ),
  
  fluidRow(
    column(12, align="center",
           textInput("searchEntry", "Search corrupt bids", value = "", placeholder = NULL),
           actionButton("searchBtn", "Search"))
    ),
  
  
  fluidRow(
    column(3, plotOutput("plot1")),
    column(5, plotOutput("plot2")),
    column(2, htmlOutput("info_card"))
  ),
  
  tags$div(id = "divDetail"
  )
)

server <- function(input, output) {
  
  observeEvent(input$searchBtn, {
    #search_results <- get_entities(input$searchEntry)
    output$plot2 <- renderPlot({
      graph_plot(entities, articles)
    }) 
  })
  
  output$plot1 <- renderPlot({
    plot1()
  })

  output$info_card <- renderUI({
    #HTML("WHAT IS THIS")
    hover_search_term<-"whitefish+energy"
    #hover_search_term<-"ryan+zinke"
    info_card(get_entity_info(hover_search_term))
  })
}

shinyApp(ui = ui, server = server)