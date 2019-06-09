## Marcel Kropp
## 09.06.2019
## Shiny Application, A minimal HTML interface
## Following the book: Web Application with Shiny R (Breeley, 2018)


function(input, output){
  output$textDisplay <- renderText({
    paste0("Title:'", input$comment,
           "'. There are ", nchar(input$comment),
           " characters in this."
           )
  })
  
  output$plotDisplay <- renderPlot({
    par(bg = "#ecf1ef") # set the background color
    plot(poly(1:100, as.numeric(input$graph)), type = "l",
         ylab="y", xlab="x")
  })
}