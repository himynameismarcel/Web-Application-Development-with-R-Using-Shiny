## Marcel Kropp
## 09.06.2019
## Shiny Application, Example 2: Javascript
## Following the book: Web Application with Shiny R (Breeley, 2018)

function(input, output, session){
  output$randomNumber <- renderText({
    theNumber <- sample(1:input$pickNumber, 1)
    session$sendCustomMessage(type = 'sendMessage', message = theNumber)
    return(theNumber)
  })
  
  output$theMessage <- renderText({
    return(input$JsMessage)
  })
}