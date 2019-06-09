## Marcel Kropp
## 09.06.2019
## Shiny Application, HTML templates
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(tidyverse)
library(gapminder)

load("geocodedData.Rdata")

function(input, output){
  theData <- reactive({
    
    mapData %>%
      filter(year >= input$year[1])
  })
  
  output$trend = renderPlot({
    
    thePlot <- theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent,
                 colour = continent)) + geom_line() + 
      ggtitle("Graph to show life expectancy by continent over time")
    
    if(input$linear){
      thePlot = thePlot + geom_smooth(method = "lm")
    }
    
    print(thePlot)
  })
}