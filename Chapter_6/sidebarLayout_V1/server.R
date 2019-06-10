## Marcel Kropp
## 09.06.2019
## Shiny Application, Sidebar Layout
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(tidyverse)
library(gapminder)
library(leaflet)
library(ggmap)
library(DT)
library(shinyjs)

if(!file.exists("geocodedData.Rdata")){
  
  mapData = gapminder %>%
    mutate(country2 = as.character(country)) %>%
    group_by(country) %>%
    slice(1) %>%
    mutate_geocode(country2, source = "dsk") %>%
    select(-country2)
  
  mapData = left_join(gapminder, mapData) %>%
    group_by(country) %>%
    fill(lon) %>%
    fill(lat)
  
  save(mapData, file = "geocodedData.Rdata")
  
} else {
  
  load("geocodedData.Rdata")
}

function(input, output) {
  
  # produce data
  
  theData = reactive({
    
    mapData %>%
      filter(year >= input$year[1], year <= input$year[2])
  })
  
  # Summary 
  
  output$summary = renderText({
    
    paste0(input$year[2] - input$year[1], " years are selected. There are ", 
           length(unique(theData()$country)), " countries in the dataset measured at ",
           length(unique(theData()$year)), " occasions.")
  })
  
  # trend
  
  output$trend = renderPlot({ 
    
    thePlot = theData() %>%
      group_by(continent, year) %>%
      summarise(meanLife = mean(lifeExp)) %>%
      ggplot(aes(x = year, y = meanLife, group = continent, colour = continent)) +
      geom_line() + ggtitle("Graph to show life expectancy by continent over time")
    
    if(input$linear){ 
      thePlot = thePlot + geom_smooth(method = "lm") 
    } 
    
    print(thePlot)
  })
  
  
  output$map = renderLeaflet({
    
    withProgress(message = "Please wait", value = 0,{
      
      incProgress(1/3, detail = "Loading data")
      Sys.sleep(0.5)
      
      incProgress(1/3, detail = "Drawing map")
      Sys.sleep(0.5)
      
      incProgress(1/3, detail = "Fniishing up")
      Sys.sleep(0.5)
      
      
      mapData %>%
        filter(year == input$year[2]) %>%
        leaflet() %>%
        addTiles() %>%
        setView(lng = 0, lat = 0, zoom = 2) %>%
        addCircles(lng = ~ lon, lat = ~ lat, weight = 1,
                   radius = ~ lifeExp * 5000, 
                   popup = ~ paste(country, lifeExp))
    })
  })
  
}