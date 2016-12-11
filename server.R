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
  
  observeEvent(
    input$getplot,
    output$whoplot <- if(input$selectfocus_list=="lang"){
      if(input$selectdata_list=="Saturday"){renderPlot({ggplot(Saturdaytweets) + geom_bar(aes_string(input$selectfocus_list,fill=input$selectfocus_list)) + theme(legend.position="none") + ggtitle(paste(selectdata_list,"tweets' language"))})
      }else{renderPlot({ggplot(Sundaytweets) + geom_bar(aes_string(input$selectfocus_list,fill=input$selectfocus_list)) + theme(legend.position="none") + ggtitle(paste(selectdata_list,"language"))})}
    }else if(input$selectfocus_list=="followers_count"){
      if(input$selectdata_list=="Saturday"){renderPlot({ggplot(Saturdaytweets) + geom_histogram(aes_string(input$selectfocus_list,fill=verified),bins = 1000) + xlim(0,10000) + ggtitle(paste(selectdata_list,"Tweeters' follower")) + facet_grid(~verified)})
      }else{renderPlot({ggplot(Sundaytweets) + geom_histogram(aes_string(input$selectfocus_list,fill=verified),bins = 1000) + xlim(0,10000) + ggtitle(paste(selectdata_list,"Tweeters' follower")) + facet_grid(~verified)})}
    }
    )
  
  observeEvent(input$getplot,
               output$irisplot <- renderPlot(ggplot(data=iris) + geom_point(aes_string(x=input$selectx,y=input$selecty,color="Species")))
  )
})