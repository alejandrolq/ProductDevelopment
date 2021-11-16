library(shiny)

shinyUI(fluidPage(

    titlePanel("Ejemplos UI dinamico"),
    tabsetPanel( tabPanel("Ejemplo1",
                          numericInput("min", "limite inferior", value=5),
                          numericInput("max", "limite superior", value = 10),
                          sliderInput("slider_eje1", "Seleccione Intervalo", min = 1, max = 15, value = 10)
                          ),
    tabPanel("Ejemplo 2",
             sliderInput('s1','s1', value = 0, min = -5, max = 5),
             sliderInput('s2','s2', value = 0, min = -5, max = 5),
             sliderInput('s3','s3', value = 0, min = -5, max = 5),
             sliderInput('s4','s4', value = 0, min = -5, max = 5),
             actionButton('clean', 'Limpiar')
             ),
    tabPanel("Ejemplo 3", 
             numericInput('n', 'Corridas', value = 10),
             actionButton('correr', 'correr')
             ),
    tabPanel("Ejemplo 4",
             numericInput('nvalue', 'Valor', value = 0)
             ),
    tabPanel("Ejemplo 5",
             numericInput('celcius', 'Temperatura en Celcius', value = NA, step = 1),
             numericInput('farenheith', 'Temperatura en Farenheith', value = NA, step = 1)
             ),
    tabPanel("Ejemplo 6",
             selectInput('dist', 'Distribucion', 
                         choices = c('Normal', 'Uniforme', 'Exponencial')),
             numericInput('nrandom', 'Tamaño de la muestra', value = 100, min = 0),
             tabsetPanel(id = 'params', type = 'hidden',
                      tabPanel('Normal',
                               numericInput('media', 'media', value = 0),
                               numericInput('sd', 'sd', value = 1)
                               ),
                      tabPanel('Uniforme',
                               numericInput('uni_min', 'min', value = 0),
                               numericInput('uni_max', 'max', value = 1)
                               ),
                      tabPanel('Exponencial',
                               numericInput('razon', 'razon', value = 1, min = 0),
                               )
                      ),
             plotOutput('plot_dist')
             )
    )
))
