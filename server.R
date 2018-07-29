#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

### loading data and setting variables and constants

data("mtcars")

a<- names(mtcars) 

i <- 1

# Define server logic required to draw a chart and calculate regression parametrs
shinyServer(function(input, output) {
   
  output$distPlot <- renderPlot({
    
    # input from ui.R
    j <- as.numeric(input$select)
    
    
    model <- lm(mtcars[,i]~mtcars[,j])
    Intercept <- model[[1]][1]
    Slope <- model[[1]][2]
    
    plot(y=mtcars[,i], x=mtcars[,j], type="p", xlab = a[j], ylab = a[i], main = paste(a[i]," = (", round(Intercept,3), ") + (", round(Slope,3), ")*", a[j]), col="blue")+abline(Intercept,Slope, col="red")

    
  })
  
})
