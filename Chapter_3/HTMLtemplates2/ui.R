## Marcel Kropp
## 09.06.2019
## Shiny Application, HTML templates 2
## Following the book: Web Application with Shiny R (Breeley, 2018)

htmlTemplate(
  "template.html",
  slider = sliderInput(inputId = "year",
                       label = "Years included",
                       min = 1952,
                       max = 2007,
                       value = c(1952, 2007),
                       sep = "",
                       step = 5),
            checkbox = checkboxInput("linear", label = "Add trend line?",
                                     value = FALSE),
            thePlot = plotOutput("trend")
)

