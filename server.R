#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$distPlot <- renderPlot({
           
             # generate bins based on input$bins from ui.R
            db <- filter(mtcars,
                         cyl %in% input$cilindro,
                         gear %in% input$marcha)
            
            ggplot(db, aes(y = mpg, x = hp)) + 
              geom_point() + 
              geom_smooth(method = "lm",
                          se = F) + 
              geom_text(aes(label = rownames(db)),
                        check_overlap = TRUE, 
                        position = position_stack(vjust = 0.005)) + 
              xlim(0.9*min(db$hp), 1.1*max(db$hp))
#                        
    })
}
