ui <- fluidPage(
  sidebarLayout(
    sidebarPanel(
      fileInput("file1", "Choose CSV File",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv")
      ),
      tags$hr(),
      downloadButton('downloadData', 'Download')
    ),
    mainPanel(
      tableOutput("contents")
    )
  )
)

