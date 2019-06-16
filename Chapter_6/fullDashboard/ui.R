## Marcel Kropp
## 10.06.2019
## Shiny Application, Full Application
## Following the book: Web Application with Shiny R (Breeley, 2018)
## This is a small test.

library(shinydashboard)
library(leaflet)

## HEADER
# the notification is called via
header <- dashboardHeader(title = "Gapminder",
                          dropdownMenuOutput("notifications"))



## SIDEBAR
## In our case we have two tabs: the main one containing the graphs and icons
## and amap tab containing the interactive leaflet map


sidebar <- dashboardSidebar(
  sidebarMenu(
    # the first two items are tab buttons that will allow us to present
    # different sets of output elements to users;
    # for the second item we give users extra information about the tab
    # (here: showing that the output elements are still in beta)
    menuItem("Dashboard", tabName = "dashboard",
             icon = icon("dashboard")),
    
    menuItem("Map", icon = icon("globe"), tabName = "map",
                                badgeLabel = "beta", badgeColor = "red"),
           
    # the rest of the sidebar setup is familiar from previous versions
    # of this application:
    sliderInput("year",
                "Years included",
                min = 1952,
                max = 2007,
                value = c(1952, 2007),
                sep = "",
                step = 5
      ),
    
    # continent selector which the info boxes and gauge respond two
    # showing the average life expectancy and GDP per capita
    selectInput("continent", "Select continent",
                choices = c("Africa", "Americas", "Asia", "Europe",
                            "Oceania"))
             
      
  )
)


## BODY
## Finally, the dashboardBody is set up using a tabItems(tabItem(), tabItem()) 
## structure:
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard",
            # the info boxes are called via
            fluidRow(
              infoBoxOutput(width = 3, "infoYears"),
              infoBoxOutput(width = 3, "infoLifeExp"),
              infoBoxOutput(width = 3, "infoGdpPercap"),
              # static info box
              infoBox(width = 3, "Shiny version", "1.1.0",
                      icon = icon("desktop"))),
            fluidRow(
              box(width = 10, plotOutput("trend"),
                  checkboxInput("linear",
                                label = "Add trend line?",
                                value = FALSE)),
              box(width = 2, 
                  # the gauge is drawn very simply in ui.R using
                  htmlOutput("gauge"))
                  )
            ),
    
    # we finish with the final tab MAP which, as can be seen, contains
    # just one box with the map in and a comment about the data in the map
    tabItem(tabName = "map",
            box(width = 12, leafletOutput("map"),
                p("Map data is from the most recent year in the selected range"))
            )
  )
)

dashboardPage(header, sidebar, body)








