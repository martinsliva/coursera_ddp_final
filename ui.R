#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Scatter chart for mtcars"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("select",label = h3("Select predictor"),
                   choices = list("cyl" = 2, "disp" = 3, "hp" = 4, "drat" = 5,"wt" = 6, "qsec" = 7, "vs" = 8, "am" = 9,"gear"= 10,"carb"=11 ), 
                   selected = 2)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
          tabsetPanel(type = "tabs", 
                      tabPanel("Chart", br(), plotOutput("distPlot")), 
                      tabPanel("Help", br(), "Chose predictor form select box. The chart shows linear regression for mpg. In the titile you can see the formula for regression line"), 
                      tabPanel("Description", br(), "The application uses standard mtcars dataset from R. Server side calculates the linear regression for outcome mpg and chosen predictor.")
                      
          
          )
    )
  )
))
