#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    setwd("D:/Documents/data_cleaner2")
    chosen_file <- input$file1
    
    source("./cargador de librerias.R")
    source("./dataframe_inicio.R")
    source("./eliminador_duplicados.R")
    source("./roles_matchempresas_agruparciudades.R")
    source("./evaluador_matches.R")
    
    datos_limpios_match
  })
  
  output$downloadData <- downloadHandler(
    filename = function() { paste(datos_limpios_match, '.csv', sep='') },
    content = function(file) {
      write.csv(datos_limpios_match, file)
    }
  )
})