library(shiny)
library(lubridate)

shinyUI(fluidPage(

    titlePanel("Shiny Inputs Ejemplos"),
    sidebarLayout(
      sidebarPanel(
        sliderInput("slider_in", 'Seleccione un valor',
                    min = 0, 
                    max = 100, 
                    value = 50,
                    step = 10,
                    post = '%',
                    animate = animationOptions(
                      interval = 250,
                      loop = TRUE
                    )),
        sliderInput("slider_multi", 'Seleccione un rango',
                    min = -10,
                    max = 10,
                    value = c(-5,5)),
        numericInput("num_in", 'Ingrese Valor',
                     min = 0,
                     max = 50,
                     value = 25),
        dateInput('single_date', 'Fecha de cumpleaños',
                  value = today(),
                  language = 'es',
                  weekstart = 1,
                  format = 'dd-mm-yyyy'),
        dateRangeInput('range_date', 'Seleccione Rango de Fechas',
                       max = today(),
                       min = today()-365,
                       start = today()-7,
                       end = today(),
                       language = 'es',
                       weekstart = 1,
                       separator = 'a'),
        checkboxInput('single_chk', 'Mostrar',
                      value = TRUE),
        checkboxGroupInput('multi_chk', 'Seleccione nivel',
                           choices = 1:5,
                           selected = 1),
        radioButtons('radio_in', 'Seleccione Genero',
                     choices = c('Masculino', 'Femenino', 'Otro'),
                     selected = 'Femenino',
                     inline = FALSE),
        actionButton('action_btn', 'Refrescar'),
        br(),
        actionLink('action_link', 'Salir'),
        submitButton('Ejecutar')
      ),
      mainPanel(
        h1("Salidas de los inputs de shiny"),
        h2("Slider IO"),
        verbatimTextOutput("single_slider_out"),
        h2("Slider Multiple IO"),
        verbatimTextOutput("multi_slider_out"),
        h2("Numeric IO"),
        verbatimTextOutput("numeric_out"),
        h2("Date IO"),
        verbatimTextOutput("single_date_out"),
        h2("Date Range IO"),
        verbatimTextOutput("range_date_out"),
        h2("Checkbox IO"),
        verbatimTextOutput("chk_out"),
        h2("Checkbox Group IO"),
        verbatimTextOutput("multi_chk_out"),
        h2("Radio IO"),
        verbatimTextOutput("radio_out"),
        h2("Action Button IO"),
        verbatimTextOutput("ab_out"),
        h2("Action Link IO"),
        verbatimTextOutput("al_out")
      )
    )
    
))
