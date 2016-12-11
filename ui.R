#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(shiny)

shinyUI(
  fluidPage(
    theme="bootstrap.css",
    titlePanel(title=div(img(src="logo.png",height=80,width=180),"Who, What and Where on Twitter at weekend's Midnight")),
    navbarPage(title="Contents",
               
               tabPanel("Introduction & Data preparation",
               p("This is a Shiny App of my final project in MA615."),
               p("In this project, I combine mining a social networking service (twitter), mapping, document creation, and shiny."),
               a(href="https://github.com/lloydliu717/MA615_Final_Assignment","View code of this project on Github"),
               p("WE WILL PUT A WORD CLOUD HERE"),
               hr(),#make dividing line
               #br(),#start new line
               code("#see code on Github Final_assignment.Rmd"),
               
               hr(),
               p("Author: Lloyd Liu, Christian Sun"),
               splitLayout(
                 img(src="4.pic.jpg",height=400,width=400),
                 img(src="3.pic.jpg",height=400,width=400))
               
               ),
               
               tabPanel("WHO",
                        sidebarLayout(
                          sidebarPanel(selectInput(inputId="selectdata",
                                                   label="Which Day",
                                                   choices=selectdata_list),
                                       selectInput(inputId="selectfocus",
                                                   label="Focus",
                                                   choices=selectfocus_list),
                                       actionButton(inputId='getplot',
                                                    label="Give mt the plot")),
                          mainPanel(plotOutput("whoplot"))
                          )
                        
                        ),
               
               tabPanel("WHAT",
                        checkboxGroupInput(inputId="cbg",
                                           label="checkbox group",
                                           choices=c("A","B","C")),
                        textOutput("outputcbg"),
                        radioButtons(inputId="cb",
                                     label="radio buttons",
                                     choices=c("a","b","c"),
                                     selected="a")),
               
               tabPanel("WHERE",
                        sidebarLayout(
                          sidebarPanel(selectInput(inputId="selectx",
                                                   label="X Axis",
                                                   choices=selectx_list),
                                       selectInput(inputId="selecty",
                                                   label="Y Axis",
                                                   choices=selecty_list),
                                       actionButton(inputId='getplot',
                                                    label="Give mt the plot")),
                          mainPanel(plotOutput("irisplot"))
                          )
                        )
               )
    )
  )