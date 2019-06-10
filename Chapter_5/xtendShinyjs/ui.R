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
  
  # the last addition is a reference to the JavaScript file that will 
  # make everything happen. We add this with the extendShinyjs()
  # function
  extendShinyjs(script = "appendText.js"),
  
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
      actionButton("reset", "Reset year"),
      
      # then we add a button to add the text and some controls to the sidebar
      actionButton("buttonClick", "Add inputs"),
        selectInput("color", "Text colour",
                    c("Red" = "red",
                      "Blue" = "blue",
                      "Black" = "black")),
      
        selectInput("size", "Text size",
                    c("Extremely small" = "xx-small",
                      "Very small" = "x-small",
                      "Small" = "small",
                      "Medium" = "medium",
                      "Large" = "large",
                      "Extra large" = "x-large",
                      "Super size" = "xx-large"))
      
    ),
    
    mainPanel(
      tabsetPanel(id = "theTabs",
        tabPanel("Summary", value = "text", div(id = "theText",
                                                textOutput("summary"))),
        tabPanel("Trend", plotOutput("trend"),
                 h3("User selection history"),
                 p(id = "selection", "")),
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