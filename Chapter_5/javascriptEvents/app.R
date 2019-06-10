## Marcel Kropp
## 09.06.2019
## Shiny Application, Responding to events in JavaScript
## Following the book: Web Application with Shiny R (Breeley, 2018)

## As an example, we're going to make a very simple program that takes a 
## long time to drwa a graph and gives you a little alert box when it is finished.
## The program is so simple that we will use the single-file app.R format.

ui <- fluidPage(
  titlePanel("JavaScript Events"),
  sidebarLayout(
    sidebarPanel(
      actionButton("redraw", "Redraw plot")
    ),
    
  mainPanel(
    plotOutput("testPlot"),
    includeHTML("events.js")
    )
  )
)

server <- function(input, output){
  output$testPlot <- renderPlot({
    input$redraw
    Sys.sleep(5)
    plot(1:10)
  })
}

# Run the application
shinyApp(ui = ui, server = server)




