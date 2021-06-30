#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
# 샤이니를 활용한 웹 어플리 케이션
# install.packages('rsconnect')
library(rsconnect)
# rsconnect::setAccountInfo(name='youtube-children-hyerin',
#                           token='56D561384EC9B721616E16C0D3CEC470',
#                           secret='bMPshQ+StNcx80he74ppDWFSGJIJQFWvOH72qtd7')
rsconnect::setAccountInfo(name='youtube-hyerin', token='D65953095460733F77114B39E4B5B7C7', secret='Jg+9M0f0uDBI1mpWIRyevWoeV8/NXiGoGV8QJdG7')




library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
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

# Define server logic required to draw a histogram
server <- function(input, output) {
   #read dataset (change directory)
   load("./table_lda_list4.r")
   
   
   output$LDA_results <- renderTable({
      # select keyword
      lda_table <- lda_list4[[as.numeric(input$var)]]
      
      # make a Dataframe
      # dt_table <- data.frame(lda_table)
      
      #render Table
      lda_table[[as.numeric(input$num)]]
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

