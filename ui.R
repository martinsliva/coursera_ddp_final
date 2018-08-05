

library(shiny)
library(ggplot2)
library(plotly)
library(leaflet)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Global Peace Index"),
  helpText("mesures the relative position of nations peacefulness. "),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("religion",label = h3("Select main religion"),
                  choices = list("All"= "All",   "Christian" = "Christian", "Islam" = "Islam", "Irreligion" = "Irreligion", "Hindu" = "Hindu","Buddhist" = "Buddhist", "Folk" = "Folk", "Jewish" = "Jewish" ), 
                  selected = "All")
    ,
    
    helpText("Main religion is religion with most followers in country. "),
    
    
    selectInput("religiosity",label = h3("Select religiosity"),
                choices = list("All"= "All",   "Most" = "most", "Middle" = "middle", "Least" = "least"), 
                selected = "All"),
   
    helpText("Religiosty is defined as an answer to question if respondent feels religious. Most means that more than 95% respondent said yes. Least means that less than 40% respondend said no. ")
    
    ),
    
    
   
   # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Chart", br(), plotOutput("distPlot")), 
                  tabPanel("Help", br(), "Chose religion or religiosity from select box.", br(),br(), "The map will be recalculated accordind to selection.", br(), "It may last some time, please be pattient."), 
                  tabPanel("Description", br(), "The application shows how peacefull is each country measured by Global Peace Index. It allows to explore map according to two parametrs - Main religion and religiosity for each country.", br(), "It describes data from respected public resources.",br(), br(), 
                           "Global Peace Index - data taken from ", tags$a(href="https://countryeconomy.com/demography/global-peace-index/", "Country Economy"), br(), br(),
                           "Religiosity - data taken from  ", tags$a(href="https://www.telegraph.co.uk/travel/maps-and-graphics/most-religious-countries-in-the-world/", "The Telegraph"), br(), br(),
                           "Main religion  - data taken from ", tags$a(href="https://en.wikipedia.org/wiki/Religions_by_country", "Wikipedie"), br(),br(), br(),br(), 
                           "Created by Martin Sliva" 
                           
                           )
                  
                  
      )
    )
  )
))
