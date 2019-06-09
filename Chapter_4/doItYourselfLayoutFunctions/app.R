## Marcel Kropp
## 09.06.2019
## Shiny Application, DoItYourself Layout - Functions
## Following the book: Web Application with Shiny R (Breeley, 2018)

server <- function(input, output){
  output$table <- renderTable({
    head(iris)
  })
}

ui <- fluidPage(
  fluidRow(
    column(width = 4,
           sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
           textInput("text", "Text")),
    column(width = 8,
           tableOutput("table")
    )
  )
)
  
  
shinyApp(ui, server)
