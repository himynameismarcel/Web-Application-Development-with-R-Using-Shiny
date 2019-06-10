## Marcel Kropp
## 09.06.2019
## Shiny Application, Grid Layout
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(shinythemes)

fluidPage(
  title = "Gapminder",
  
  h2("Gapminder explorer",
     style = "font-family: 'Impact'; color: purple;
     font-size: 32px;"),
  
  # now, we add in a row of UI elements using the fluidRow() function
  # and define two equal columns within this row 
  fluidRow(
    column(6,
           wellPanel(
             sliderInput("year",
                         "Years included",
                         min = 1952,
                         max = 2007,
                         value = c(1952, 2007),
                         sep = "",
                         step = 5
           ))
  ),
    column(6,
           p("Map data is from the most recent year in the selected range",
             style = "text-align: center;"))
  
  ),
  
  hr(),
  
  fluidRow(
    column(6, plotOutput("trend")),
    column(6, leafletOutput("map"))
  ),
  
  fluidRow(
    column(6,
           checkboxInput("linear", label = "Add trend line?",
                         value = FALSE),
           textOutput("summary")
      )
    )
  )
