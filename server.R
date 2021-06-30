library(shiny)


function(input, output) {
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