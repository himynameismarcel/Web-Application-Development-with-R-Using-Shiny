## Marcel Kropp
## 08.06.2019
## Shiny Application, minimalExample
## Following the book: Web Application with Shiny R (Breeley, 2018)

function(input, output) {
  output$textDisplay = renderText({
    paste0("You said '", input$comment, 
           "'. There are ", nchar(input$comment),
           " characters in this.")
  })
}