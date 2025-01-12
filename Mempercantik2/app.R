library(shiny)
library(bslib)
library(shinyBS)
library(shinyjs)

pop_test <- c("Mean Test", "Proportion Test", "Variance Test")
sd_Type <- c("Population", "Sample")
sd_Type <- c("Population", "Sample")
param_assumption <- c("Equals", "Not Equals")
properTest <- c("One-Tailed Left", "One-Tailed Right", "Two-Tailed")

render_homeTab_ui <- function(id){
  ns <- NS(id)
  
  tagList(
    sidebarPanel(
      uiOutput("sidebarInput_ui")
    ),
    mainPanel("main Content")
  )
}

render_homeNav_ui <- function(id){
  tagList(
    div(id = "analysis_navigation", style="display: flex; justify-content: space-between; height:35px; align-items: center; margin-bottom: 30px",
        actionButton(class="home_nav", inputId = "one_pop_panel", div(icon("user", class = "fa-solid fa-user"), span("One Population Test"))),
        actionButton(class="home_nav", inputId = "two_pop_panel", div(icon("user-group"), span("Two Population Test"))),
        actionButton(class="home_nav", inputId = "summary_panel", div(icon("chart-simple"), span("Summary Statistics")))
    ),
  )
}

sidebarInput_ui <- function(id, type){
  ns <- NS(id)
  
  if(type == "One Population"){
    tagList(
      selectInput("one_pop_test", "Select Test", choices = pop_test, selected = "Mean Test"),
      
      tabsetPanel(
        id = "popTest1",
        type = "hidden",
        tabPanel("Mean Test",
                 numericInput("mu", "Mean Hypothesis:", value = 400),
                 numericInput("mean", "Sample Mean:", value = 398),
                 selectInput("sd_Type1", "Standard Deviation Type:", choices = sd_Type, selected = "Population"),
                 numericInput("sd", "Standard Deviation:", value = 35, min = 0.01),
                 numericInput("n_mean", "Sample Size:", value = 40, min = 1),
        ),
        tabPanel("Proportion Test",
                 numericInput("p_pop", "Proportion Hypothesis", value = 0.08),
                 numericInput("p_sample", "Sample Proportion", value = 0.05),
                 numericInput("n_prop", "Sample Size:", value = 40, min = 1),
        ),
        tabPanel("Variance Test",
                 numericInput("var_pop", "Population Variance", value = 0.8),
                 numericInput("var_sample", "Sample Variance", value = 1.2),
                 numericInput("n_var", "Sample Size:", value = 40, min = 1),
        )
      )
    )
  } else {
    tagList(
      selectInput("two_pop_test", "Select Test", choices = pop_test, selected = "Mean Test"),
      tabsetPanel(
        id = "popTest2",
        type = "hidden",
        tabPanel("Mean Test",
                 span("Population Mean: ", style = "font-weight: normal"),
                 fluidRow(
                          column(4,
                            numericInput("mu1", "Population 1:", value = 88)
                          ),
                          column(4,
                            numericInput("mu2", "Population Mean 2:", value = 86)
                          )
                 ),
                
                 numericInput("mean1", "Sample Mean 1:", value = 85),
                 numericInput("mean2", "Sample Mean 2:", value = 81),
                 selectInput("sd_Type2", "Standard Deviation Type:", sd_Type),
                 numericInput("sd1", "Standard Deviation 1:", value = 4, min = 0.01),
                 numericInput("sd2", "Standard Deviation 2:", value = 5, min = 0.01),
                 uiOutput("sd_assumption"),
                 numericInput("n_mean1", "Sample Size 1:", value = 12, min = 1),
                 numericInput("n_mean2", "Sample Size 2:", value = 10, min = 1)
        ),
        tabPanel("Proportion Test",
                 selectInput("prop_assumption", "Population Proportion Assumption", choices = param_assumption),
                 uiOutput("prop_params"),
                 numericInput("n_interest1", "Target Size Sample 1", value = 0.05),
                 numericInput("n_interest2", "Target Size Sample 2", value = 0.05),
                 numericInput("n_prop1", "Sample Size 1:", value = 40, min = 1),
                 numericInput("n_prop2", "Sample Size 2:", value = 40, min = 1)
        ),
        tabPanel("Variance Test",
                 numericInput("var_sample1", "Sample Variance 1", value = 1.2),
                 numericInput("var_sample2", "Sample Variance 1", value = 1.2),
                 numericInput("n_var1", "Sample Size 1:", value = 40, min = 1),
                 numericInput("n_var2", "Sample Size 2:", value = 40, min = 1),
        )
      ) 
    )
  }
}

####################################################################################
# MAIN UI
ui <- fluidPage(
  
  # Menambahkan CSS
  tags$head(
    tags$style(HTML("
      .header_row{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 60px;
        font-size: 16px;
      }
      
      .header_tab{
        display:flex;
        flex:80%;
        justify-content: center;
        align-items: center;
        
      }
  
      .home_nav_tab {
        margin: 0px 20px;
        position: relative;
        cursor: pointer;
        border: none;
        box-shadow: none !important;
        background-color: transparent;
      }
  
      .home_nav_tab::before {
          content: '';
          position: absolute;
          bottom: -2px;
          left: 0px;
          height: 2px;
          width: 100%;
          background: black;
          border-radius: 50px;
          transform: scaleX(0);
          transition: transform 0.3s ease-in-out;
      }

      .home_nav_tab.active {
        background-color: transparent !important;
        box-shadow: none !important;
        border:none;
      }
  
      .home_nav_tab:hover::before,
      .home_nav_tab.active::before {
        transform: scaleX(1);
      }
      
      .home_nav:hover{
        background-color: #e1e2e5;
      }
      
      .home_nav {
        display: flex;
        color: blue;
        justify-content: center;
        flex:1;
        padding: 10px;
        border-radius: 5px;
        transition: background-color 0.25s ease-in-out;
        border: none;
      }
    "))
  ),
  
  # Menambahkan HTML
  tags$script(HTML("
    document.addEventListener('DOMContentLoaded', function() {
      document.querySelectorAll('.home_nav').forEach(function(home_nav) {
        home_nav.onclick = function() {
          document.querySelectorAll('.home_nav').forEach(function(nav) {
            nav.style.backgroundColor = '';
            nav.style.color = '';
          });
          this.style.backgroundColor = '#337ab7';
          this.style.color = 'white';
        };
      });
    });
    
    document.addEventListener('DOMContentLoaded', function() {
      document.querySelectorAll('.home_nav_tab').forEach(function(tab) {
        tab.addEventListener('click', function() {
          document.querySelectorAll('.home_nav_tab').forEach(function(otherTab) {
            otherTab.classList.remove('active'); // Remove 'active' from all tabs
          });
          this.classList.add('active'); // Add 'active' to the clicked tab
        });
      });
    });
  ")),
  
  div(class = "header_row",
      div(span("Hypothesis Test")),
      div(class = "header_tab",
        actionButton(class="home_nav_tab", inputId = "home", div(icon("house", class = "fa-solid fa-user"), span("Home"))),
        actionButton(class="home_nav_tab", inputId = "documentation", div(icon("file", class="fa-solid fa-file"), span("Documentation"))),
        actionButton(class="home_nav_tab", inputId = "about_us", div(icon("users"), span("About Us")))
      ),
      div(class= "github_tab",
        actionButton("github_link", icon("github"), onclick="window.open('https://stackoverflow.com/questions/37795760/r-shiny-add-weblink-to-actionbutton')")
      ),
  ),
  
  bsTooltip("github_link", "source code", placement = "bottom"),
  
  uiOutput("home_nav_ui"),
  
  sidebarLayout(
    uiOutput("home_tab_ui"),
    mainPanel("content")
  )
)



############################################################################################
# Main Server
server <- function(input, output, session) {
  useShinyjs()
   
  observeEvent(input$home, {
    output$home_nav_ui <- renderUI(render_homeNav_ui("homeNav"))
    
    observeEvent(input$one_pop_panel, {
      output$home_tab_ui <- renderUI(render_homeTab_ui("one_pop_panel"))
      
      observeEvent(input$one_pop_test, {
        updateTabsetPanel(inputId = "popTest1", selected = input$one_pop_test)
      })
      
      observeEvent(input$one_pop_panel, {
        output$sidebarInput_ui <- renderUI(
          sidebarInput_ui(id = "one_pop", type = "One Population")
        )
      })
    })
    
  })
  
  observeEvent(input$two_pop_test, {
    updateTabsetPanel(inputId = "popTest2", selected = input$two_pop_test)
  })
  
  observeEvent(input$two_pop_panel, {
    output$sidebarInput_ui <- renderUI(
      sidebarInput_ui(id = "two_pop", type = "Two Population")
    )
  })
  
  # for two population
  observeEvent(input$prop_assumption, {
    if(input$prop_assumption == "Equals") {
      output$prop_params <- renderUI({
        NULL
      })
    } else {
      output$prop_params <- renderUI({
        tagList(
          numericInput("p_pop1", "Population Proportion 1", value = 0.08),
          numericInput("p_pop2", "Population Proportion 2", value = 0.08)
        )
      })
    }
  })
  
  observeEvent(input$sd_Type2, {
    if(input$sd_Type2 == "Sample") {
      output$sd_assumption <- renderUI({
        selectInput("sd_assumption", "Population Standard Deviation Assumption", choices = param_assumption)
      })
    } else {
      output$sd_assumption <- renderUI({NULL})
    }
  })
}

shinyApp(ui, server)