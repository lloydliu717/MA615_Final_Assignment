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

shinyServer(function(input, output){
  output$outputcbg <- renderText(input$cbg)
  
  
  observeEvent(input$getplot,
               output$irisplot <- renderPlot(ggplot(data=iris) + geom_point(aes_string(x=input$selectx,y=input$selecty,color="Species")))
  )
})