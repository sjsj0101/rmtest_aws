library(shiny)

library(ggvis)

ui <- fluidPage(
  titlePanel("It's ALIVE"),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("season", "season",
                  1, 4, 1, step = 1),
      sliderInput("episode", "episode", 
                  1, 10, 1,step =1)
    ),
    mainPanel(
      imageOutput("image"),
      textOutput("text")
    )
))

server <- function(input, output) {
  output$image <- renderImage({
    if (input$season == 1 & input$episode == 1){
      return(list(
        src = "www/s1e1.jpg",
        filetype = "image/jpeg",
        width = 600,
        height = 400,
        alt = "s1e1"
      ))
    } else if (input$season == 1 & input$episode == 2){
      return(list(
        src = "www/s1e2.jpg",
        filetype = "image/jpeg",
        width = 600,
        height = 400,
        alt = "s1e2"
      ))
    }

  },deleteFile = FALSE)
}

shinyApp(ui = ui, server = server)

