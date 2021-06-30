
library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("토픽 갯수별 LDA 결과"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("var", "Select a Keyword", 
                  choice = c("코로나19 + 유아" = 1,
                             "유아 + 재난안전" = 2,
                             "COVID-19 + children" = 3,
                             "children + disaster safety" = 4),
                  # choice = c("t.k.cov"=1,
                  #            "t.k.dis"=2,
                  #            "t.u.cov"=3,
                  #            "t.u.dis"=4),
                  selectize = F),  
      selectInput("num", "Select a Topic Num", 
                  choice = c("3" =1,"4"=2,"5"=3,"6"=4,"7"=5,"8"=6,"9"=7,"10"=8,
                             "11"=9,"12"=10,"13"=11,"14"=12,"15"=13,"16"=14,"17"=15,
                             "18"=16,"19"=17,"20"=18), 
                  selectize = F)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tableOutput("LDA_results")
    )
  )
)