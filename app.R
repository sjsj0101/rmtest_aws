library(shiny)

library(ggvis)

# For dropdown menu
actionLink <- function(inputId, ...) {
  tags$a(href='javascript:void',
         id=inputId,
         class='action-button',
         ...)
}

ui <- fluidPage(
  titlePanel("It's ALIVE"),
  fluidRow(
    column(3,
           wellPanel(
             h4("Filter"),
             sliderInput("season", "season",
                         1, 4, 1, step = 1),
             sliderInput("episode", "episode", 1, 10, 1,step =1),
    column(9,
           ggvisOutput("plot1"),
           wellPanel(
             span("Number of movies selected:",
                  textOutput("n_movies")
             )
           )
    )
  )
)))

server <- function(input, output) {}

shinyApp(ui = ui, server = server)

