#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggvis)
library(dplyr)

rawdata
names <- colnames(rawdata)
names1 <- colnames(rawdata[,1:22])


# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Grade Visualizer"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         conditionalPanel(
           condition = "input.tabselected==1",
           fluidRow(
             h3("Grade Distribution"),
             column(3, tableOutput('table'))
           )
                 ),
         conditionalPanel(
           condition = "input.tabselected==2",
           h3("Panel of 2nd tab"),
           selectInput("var1", "X-axis Variable", 
                       names1,
                       selected = "HW1"
                       ),
           sliderInput("bins","Bin Width",
                       min = 1,
                       max = 10,
                       value = 10)
           
         ),
         conditionalPanel(
           condition = "input.tabselected==3",
           h3("Panel of 3rd tab"),
           selectInput("var2", "X-axis Variable",
                       names,
                       selected = "Test1"),
           selectInput("var3","Y-axix Variable",
                       names,
                       selected = "overall"),
           sliderInput("opacity","Opacity",
                       min = 0,
                       max = 1,
                       value = 0.5),
           radioButtons("lines","Show Line",choices = c("none","lm","lowess"),
                        selected = "none")
         )
         
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         tabsetPanel(type = "tabs",
                     tabPanel("Barchart", value=1,
                              ggvisOutput("barchart")),
                     tabPanel("Histogram",value=2,
                              ggvisOutput("histogram"),
                              h4("Summary Statistics"),
                              verbatimTextOutput("summary")),
                     tabPanel("Scatterplot",value=3,
                              ggvisOutput("scatterplot"),
                              h4("Correlation"),
                              verbatimTextOutput("Correlation")),
                     id="tabselected")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   vis_barchart <- reactive({
     grade_table %>% 
       ggvis(~Grade,~count,fill :="lightblue",opacity :=0.5) %>%
       layer_bars()
   })
   vis_barchart %>% bind_shiny("barchart")
   output$table <- renderTable(grade_table)
   
   
   vis_histogram <- reactive({
     var1 <- prop("x",as.symbol(input$var1))
     rawdata %>% 
       ggvis(x = var1, fill :="orange",opacity :=0.5) %>%
       layer_histograms(stroke := 'white',
                        width = input$bins
                        )
   })
   vis_histogram %>% bind_shiny("histogram")
   output$summary <- renderPrint(
   print_stats(unlist(summary_stats(rawdata[,input$var1]),use.names = TRUE))
  )
   
   
   vis_scatterplot <- reactive({
     var2 <- prop("x",as.symbol(input$var2))
     var3 <- prop("y",as.symbol(input$var3))
     if (input$lines=="none"){
       rawdata%>% ggvis(x=var2,y=var3,opacity :=input$opacity) %>% 
         layer_points()
     } else if (input$lines=="lm"){  
       rawdata %>% 
         ggvis(x=var2,y=var3,opacity :=input$opacity) %>% 
         layer_points() %>% layer_model_predictions(model = "lm",se=FALSE)
     }  else if (input$lines=="lowess"){
       rawdata %>% 
         ggvis(x=var2,y=var3,opacity :=input$opacity) %>% 
         layer_points() %>% 
         layer_smooths()
             
     }
     
   })
   vis_scatterplot %>% bind_shiny("scatterplot")
   output$Correlation <- renderText(
     cor(rawdata[,input$var2], rawdata[, input$var3])
   )
   
    
   
}

  


# Run the application 
shinyApp(ui = ui, server = server)


