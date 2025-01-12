library(shiny)

# UI
ui <- fluidPage(
  titlePanel("Styled Numeric Input in Shiny"),
  
  sidebarLayout(
    sidebarPanel(
      tags$style(HTML("
        .numeric-input-container {
          display: flex;
          align-items: center;
          border: 1px solid #ddd;
          border-radius: 8px;
          padding: 8px;
          background-color: #f9f9f9;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        .numeric-input-container input {
          border: none;
          outline: none;
          font-size: 16px;
          flex-grow: 1;
          background: transparent;
          margin-right: 10px;
        }
        .numeric-input-container button {
          background-color: #007bff;
          color: #fff;
          border: none;
          padding: 8px 12px;
          border-radius: 4px;
          cursor: pointer;
          transition: background-color 0.3s;
        }
        .numeric-input-container button:hover {
          background-color: #0056b3;
        }
      ")),
      
      div(
        class = "numeric-input-container",
        numericInput("num_input", label = NULL, value = 10, min = 1, max = 100),
        actionButton("submit", "Submit")
      )
    ),
    
    mainPanel(
      textOutput("output")
    )
  )
)

# Server
server <- function(input, output, session) {
  output$output <- renderText({
    paste("You entered:", input$num_input)
  })
}

# Run App
shinyApp(ui, server)
