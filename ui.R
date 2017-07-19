#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Data Cleaner- From tool to automation csv"),
  sidebarPanel(
    fileInput('file1', 'Corrida tool',
              accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv')),
    tags$hr(),downloadButton('downloadData', 'Download clean data')
    
  ),
  mainPanel(
    tableOutput('contents')
  )
))