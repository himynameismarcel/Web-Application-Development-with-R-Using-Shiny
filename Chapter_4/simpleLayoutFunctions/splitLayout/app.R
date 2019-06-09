## Marcel Kropp
## 09.06.2019
## Shiny Application, Simple Shiny Layout Function, splitLayout
## Following the book: Web Application with Shiny R (Breeley, 2018)

server <- function(input, output){
  output$table <- renderTable({
    head(iris)
  })
}

ui <- splitLayout(
  cellWidth = c("20%", "20%", "60%"),
  sliderInput("slider", "Slider", min = 1, max = 100, value = 50),
  textInput("text", "Text"),
  tableOutput("table")
)

shinyApp(ui, server)
