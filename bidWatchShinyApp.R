library(shiny)
source('first_plot.R')
source('plot_2.R')


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
  
  
  tags$div(id = "divDetail"
  )
)

server <- function(input, output) {
  
  output$plot1 <- renderPlot({
    plot1()
  })
  
  output$plot2 <- renderPlot({
    plot2()
  }) 
  
  
}

shinyApp(ui = ui, server = server)