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
    titlePanel("Who, What and Where on Twitter at weekend's Midnight",windowTitle = "Twitter Shiny"),
    navbarPage(title="Contents",
               
               tabPanel("Introduction & Data preparation",
               p("This is a Shiny Application."),
               p("This is the second paragraph"),
               
               a(href="https://github.com/lloydliu717/MA615_Final_Assignment","View code of this project on Github"),
               hr(),#make dividing line
               br(),#start new line
               code(code_of_twitter_setting)
               ),
               
               tabPanel("pics",
                        splitLayout(img(src="RStudio-Ball.png"),
                        img(src="shiny-cheatsheet.png"),
                        img(src="TrumpAndObama.png"))
                        ),
               
               tabPanel("control widgets",
                        checkboxGroupInput(inputId="cbg",
                                           label="checkbox group",
                                           choices=c("A","B","C")),
                        textOutput("outputcbg"),
                        radioButtons(inputId="cb",
                                     label="radio buttons",
                                     choices=c("a","b","c"),
                                     selected="a")),
               
               tabPanel("iris",
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