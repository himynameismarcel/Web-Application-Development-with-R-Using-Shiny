## Marcel Kropp
## 09.06.2019
## Shiny Application, Example 2: Javascript
## Following the book: Web Application with Shiny R (Breeley, 2018)

fluidPage(
  #flexible layout function
  h4(HTML("Think of a number:</br>Does Shiny or </br>Javascript rule?")),
  sidebarLayout(
    sidebarPanel(
      # sidebare configuration
      sliderInput("pickNumber", "Pick a number",
                  min = 1, max = 10, value = 5),
      tags$div(id = "output") # tags$XX for holding dropdown
    ),
    
    mainPanel(
      includeHTML("dropdownDepend.js"), # include JS file
      textOutput("randomNumber"),
      hr(),
      textOutput("theMessage")
    )
  )
)