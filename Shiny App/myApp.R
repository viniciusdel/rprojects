library(shiny)
library(shinythemes)

ui <- fluidPage(theme = shinytheme("yeti"),
                navbarPage(
                  "My first App!",
                  tabPanel("Navbar 1",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Give Name:", ""),
                             textInput("txt2", "Surname:", ""),
                           ),
                           mainPanel(
                             h2("Header 1"),
                             h4("Output 1"),
                             verbatimTextOutput("txtout"),
                           )
                  ),
                  
                  tabPanel("Navbar 2")
                )
)

#server
server <- function(input, output){
  output$txtout <- renderText({
    paste(input$txt1, input$txt2, sep = " ")
  })
}   #server

shinyApp(ui = ui, server = server)
