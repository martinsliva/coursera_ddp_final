

library(shiny)
library(ggplot2)
library(plotly)
library(tidyverse)
library(rvest)
library(RColorBrewer)
library(ggthemes)
library(ggalt)
library(ggmap)

### loading data and setting variables and constants
index <- read.csv("gpi.csv")  ### loading data

index$Country<-as.character(index$Country) ### defactoring

#### creating classes for map

breaks_map = c(0, 10, 20, 40, 60, 80, 100, 120, 140, 160, 170)
labels_map = c("0-10", "10-20", "20-40", "40-60", "60-80", "80-100", "100-120", "120-140", "140-160", "160 +")

index$Classes <- cut(index$Ranking, 
                     breaks = breaks_map,
                     labels = labels_map)

world <- ggplot2::map_data("world") %>%
  filter(region != "Antarctica")

# Define server logic required to draw a chart and calculate regression parametrs
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    
    # input from ui.R
    j <- input$religion
    i <- input$religiosity
    
    if (i=="All"& j=="All") index_chart <- index 
       else if (i=="All") index_chart <- index[index$Religion==j,]
              else if (j=="All") index_chart <- index[index$Religiosity==i,]
                      else index_chart <- index[index$Religion==j&index$Religiosity==i,]
    
  
    
    ### creating map
    
    ggplot() +
      geom_map(data = world, map = world,
               aes(x = long, y = lat, map_id = region),
               col = "lightblue", fill= "lightgrey", size = 0.1) +
      geom_map(data = index_chart, map = world,
               aes(map_id = Country, fill = Classes)) +
      ggalt::coord_proj("+proj=wintri") + # for Winkel Trimple projection
      scale_fill_brewer(NULL, palette = "RdYlGn", direction = -1) +
      ggthemes::theme_map() +
      theme(plot.title = element_text(face = "bold")) +
      labs(title = "Global Peace Index",
           subtitle = "Countries sorted by rank",
           caption = "Sources: Wikipedia, The Telegraph, Country Economy")
    
    
    
  }, width = "auto", height = 720)
  
})
