#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(dplyr)
library(ggplot2)

# Define UI for application that draws a histogram
fluidPage(

    # Application title
    titlePanel("Effect of Power in Mile per Gas"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("cilindro",
                        "Number of cylinders:",
                        min = 4,
                        max = 8,
                        step = 2,
                        value = 6),
            radioButtons("marcha",
                        "Number of gears:",
                        choices = c(3,4,5))            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
