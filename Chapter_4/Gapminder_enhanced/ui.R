## Marcel Kropp
## 08.06.2019
## Shiny Application, Gapminder
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(leaflet)
library(DT)

fluidPage(
  
  titlePanel("Gapminder"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "year",
                  label = "Years included",
                  min = 1952,
                  max = 2007,
                  value = c(1952, 2007),
                  sep = "",
                  step = 5
      ),
      
      # checkboxInput("linear", label = "Add trend line?", value = FALSE),
      
      conditionalPanel(
        condition = "input.theTabs == 'trend'",
        checkboxInput("linear", label = "Add trend line?",
                      value = FALSE)
      ),
      
      uiOutput("yearSelectorUI"),
      
      # Modal (elements from Bootstrap, pop-up messages)
      actionButton("showModal", "Launch loyalty test")
      
    ),
    
    mainPanel(
      tabsetPanel(id = "theTabs",
        tabPanel("Summary", textOutput("summary"),
                 value = "summary"),
        tabPanel("Trend", plotOutput("trend"),
                 value = "trend"),
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