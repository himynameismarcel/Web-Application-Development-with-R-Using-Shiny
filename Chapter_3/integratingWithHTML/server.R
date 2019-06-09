# Marcel Kropp
## 09.06.2019
## Shiny Application, Integrating Shiny with HTML (or the other way around)
## Following the book: Web Application with Shiny R (Breeley, 2018)

library(tidyverse)

load("geocodedData.Rdata")

# next, we define the reactive part of the application, as shown in the following
# code:
function(input, output){
  
  output$plotDisplay <- renderPlot({
    gapminder %>%
      filter(country == input$country) %>%
      ggplot(aes(x = year, y = lifeExp)) + 
      geom_line()
  })
  
  output$outputLink <- renderText({
    
    link = "https://en.wikipedia.org/wiki/"
    
    paste0('<form action="', link, input$country, '">
        <input type="submit" value="Go to Wikipedia">
      </form>')
  })
}