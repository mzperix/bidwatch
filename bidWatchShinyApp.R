library(shiny)
source('first_plot.R')
source('plot_2.R')

ui <- fluidPage(
  theme = "styles.css",
  
  #header
  tags$div(id = "divBanner",
    tags$img(src="banner.png", width = 1440, id = "imgBanner")),
  
  
  #main window
  tags$div(id = "divMain",
  h1("Why watch bids?"),
    #tags$img(src="linebreak", height = 10, id = "imgLine"),
  tags$div(id = "divMotivation",
  p("Public procurement is one of the government activity most vulnerable to corruption. In addition to the volume of transactions and the financial interests at stake, corruption risks are exacerbated by the complexity of the process, the close interaction between public officials and businesses, and the multitude of stakeholders. (OCED, 2016)"),
  p("This results in exaggerated costs and a decrease in quality. A study by the OECD and the World Bank shows that corruption in the infrastructure and extractives sectors lead to misallocation of public funds and substandard and insufficient services…  it has been estimated that between 10-30% of the investment in publicly funded construction projects may be lost through mismanagement and corruption (OECD, 2015a)."),
  p("The Construction Sector Transparency Initiative (CoST) also estimates that “annual losses in global construction through mismanagement, inefficiency and corruption could reach USD 2.5 trillion by 2020” (COST, 2012)."),
  p("Four biggest corruption categories, as estimated by OECD - Extractive (19% of bribery cases), Construction (15%), Transportation and storage (15%), Information and Communication (10%)"),
  p("Transparency is the #1 called for reform by The 2014 Business and Industry Advisory Committee to the OECD (BIAC) Economic Survey!"),
  p("In order for citizens and civil society organizations to fulfil an oversight role, as so-called watchdog, data availability needs to be paired with timeliness, data quality, processing capacity, effective reporting and whistleblower channels."))
  ),
  
  fluidRow(
    column(3, plotOutput("plot1")),
    column(5, plotOutput("plot2"))
  )#,
  
  
  #sliderInput(inputId = "num", label = "Choose a number", value = 25, min = 1, max = 100 ), 
  #textInput(inputId="title", label = "Write a title", value = "Histogram of Random Normal Values"),
  #plotOutput("hist")
  
  )

server <- function(input, output){
  
  output$plot1 <- renderPlot({
    plot1()
     })
  
  output$plot2 <- renderPlot({
    plot2()
    }) 
 
  
}

shinyApp(ui = ui, server = server)