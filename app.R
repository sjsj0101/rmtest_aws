library(shiny)

library(ggvis)

ui <- fluidPage(
  titlePanel("It's ALIVE"),
  fluidRow(
    column(3,wellPanel(
      sliderInput("season", "season",
                  1, 4, 1, step = 1),
      sliderInput("episode", "episode", 
                  1, 10, 1,step =1)
    )),
    column(3,imageOutput("image")),
    column(2,textOutput("text"))
  
))

server <- function(input, output) {
  output$image <- renderImage({
      list(
        src = paste("www/s",input$season,"e",input$episode,".jpg",sep=""),
        filetype = "image/jpeg",
        width = 600,
        height = 400,
        alt = "s1e1"
      )
  },deleteFile = FALSE)
  
  
}

shinyApp(ui = ui, server = server)

