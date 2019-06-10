## Marcel Kropp
## 09.06.2019
## Shiny Application, Gapminder
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(leaflet)
library(DT)
library(shinyjs)

fluidPage(
  
  # we need to define the CSS in the head of the HTML using tabs$head:
  tags$head(
    tags$style(HTML(".redText {
                    color: red;
                    }"
    ))
  ),
  
  
  # we need to add useShinyjs() anywhere within fluidPage() in ui.R
  useShinyjs(),
  
  titlePanel("Gapminder"),
  
  sidebarLayout(
    sidebarPanel(
      div(id = "yearPanel",
          sliderInput(inputId = "year",
                      label = "Years included",
                      min = 1952,
                      max = 2007,
                      value = c(1952, 2007),
                      sep = "",
                      step = 5
          )
      ),
      
      # checkboxInput("linear", label = "Add trend line?", value = FALSE),
      
      conditionalPanel(
        condition = "input.theTabs == 'trend'",
        checkboxInput("linear", label = "Add trend line?",
                      value = FALSE)
      ),
      
      uiOutput("yearSelectorUI"),
      
      # Modal (elements from Bootstrap, pop-up messages)
      actionButton("showModal", "Launch loyalty test"),
      
      # we add a button
      checkboxInput("redText", "Red text?"),
      
      # we add a button for the user to reset everything
      actionButton("reset", "Reset year")
      
    ),
    
    mainPanel(
      tabsetPanel(id = "theTabs",
        tabPanel("Summary", value = "text", div(id = "theText",
                                                textOutput("summary"))),
        tabPanel("Trend", value = "graph", plotOutput("trend"),
                 p(id = "controlList")),
        tabPanel("Map", leafletOutput("map"), 
                 p("Map data is from the most recent year in the selected range; 
                     radius of circles is scaled to life expectancy"),
                 value = "map"),
        tabPanel("Table", dataTableOutput("countryTable"),
                 value = "table")
      )
    )
  )
)