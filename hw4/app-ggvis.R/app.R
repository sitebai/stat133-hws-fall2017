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

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Old Faithful Geyster Data"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         selectInput("select",
                     label=h3("Select variable"),
                     choices = list("eruptions"="eruptions",
                                    "waiting"="waiting"),
                     selected = "eruptions"),
         sliderInput("width",
                     "Bind Width",
                     min=0.2,
                     max=2,
                     value=1),
         radioButtons("scale",label = h3("choose scale"),
                      choices = list("none"=1,
                                     "std units"=2,
                                     "scale"=3
                      ),
                      selected = 1)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         ggvisOutput("disPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  vis_plot<-reactive({
    xvar <- prop("x", as.symbol(input$select))
    histogram <- faithful %>% 
      ggvis(x=xvar) %>% 
      layer_histograms(stroke := 'white', width = input$width)
  })
  
  vis_plot %>% bind_shiny("disPlot")
   
  

}

# Run the application 
shinyApp(ui = ui, server = server)

