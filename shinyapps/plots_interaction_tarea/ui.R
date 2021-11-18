library(shiny)
library(DT)

shinyUI(fluidPage(

    titlePanel("Tarea Shiny Plots"),
    tabsetPanel(
      tabPanel('Clicks plots', 
               fluidRow(
                 column(6,
                        plotOutput('plot_click_options', 
                                   click = 'clk',
                                   dblclick = 'dclk',
                                   hover = 'mouse_hover',
                                   brush = 'mouse_brush'),
                        verbatimTextOutput('click_data'),
                        actionButton('action_btn', 'Limpiar Seleccion'),
                        ),
                 column(6,
                        DT::dataTableOutput('mtcars_tbl')
                        #tableOutput('mtcars_tbl')
                        )
               )
               )
    )
    
))
