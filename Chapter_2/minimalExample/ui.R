## Marcel Kropp
## 08.06.2019
## Shiny Application, minimalExample
## Following the book: Web Application with Shiny R (Breeley, 2018)

fluidPage(
  titlePanel("Minimal application"),
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "comment",
                label = "Say something?",
                value = ""
                )),
    mainPanel(
      h3("This is you saying it"),
      textOutput(("textDisplay"))
    )
  )
)