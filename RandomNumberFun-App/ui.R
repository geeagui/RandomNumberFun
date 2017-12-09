# ui Random Number Fun

library(shiny)

# Define UI for application that draws random numbers
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Plot Random Numbers and Trace a Value - A Visualization Tool"),
  
  # Sidebar with a slider input for values
  sidebarLayout(
    sidebarPanel(
      numericInput("tracer","Input (X or Y) number value to trace:",value=0,min=0,max=1000), 
      sliderInput("numeric","How many random numbers to be plotted?",value=500,min=1,max=1000,step=1),
      sliderInput("sliderX", "Pick minimum and maximum values for X", min=-1000, max=1000, value=c(-1000,1000)),
      sliderInput("sliderY", "Pick minimum and maximum values for Y", min=-1000, max=1000, value=c(-1000,1000)),
      checkboxInput("replacement",paste(strwrap("With Replacement",width=17),"... No replacement could quickly (>2001) lead to an error!",collapse="\n"), value=T),
      checkboxInput("show_xlab","Show / hide x axis label", value=T),
      checkboxInput("Show_ylab","Show / hide y axis label", value=T),
      checkboxInput("show_title","Show / hide title", value=T),
      sliderInput("bins","Number of bins:",min=1,max=100,value=50)
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="tabs",
                  tabPanel("Random Number Chart",br(),plotOutput("plot1"),p(strong('Green'),'circles are even values. ', strong('Blue'),'circles are odd values. ','The',strong('asterisk'),'is the number tracer.'),p("Increase/decrease input value and see if shows up as the tracer. Random values are from 1 to 1000, pick any one and move the slider back and forth. Minimum and maximum values for X and Y will shrink the window in which data is displayed. Undesecting Replacement will reduce the data values plotted and may cause errors on the chart. Select Bins value, only affects Distribution Charts, to increase/decrease the number of horizontal slices for data visualization.")),
                  tabPanel("Distribution Charts",br(),plotOutput("plot2"),p('This is another way to', strong('visualize'), 'the generated random data. It appears evenly distributed.','The',strong('asterisk'),'is the number tracer. Top chart is for X-data and bottom chart is for Y-data.'))
                  )
    )
  )
))
