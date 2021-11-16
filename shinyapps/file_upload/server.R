library(shiny)
library(dplyr)
library(lubridate)

shinyServer(function(input, output) {
  
  archivo_cargado <- reactive({
    contenido_archivo <- input$cargar_archivo
    if(is.null(contenido_archivo)){
      return(NULL)
    }
    if(stringr::str_detect(contenido_archivo$name,'csv')){
      out <- readr::read_csv(contenido_archivo$datapath)
    } else if (stringr::str_detect(contenido_archivo$name,'tsv')){
      out <- readr::read_tsv(contenido_archivo$datapath)
    } else {
      out <- data.frame(extension_archivo="La extension del archivo no es soportaa")
    }
    
    return(out)
  })
  
  output_df <- reactive({
    if(!is.null(archivo_cargado())){
      out <- archivo_cargado() %>%
        dplyr::filter(Date >= input$fechas[1], 
               Date <= input$fechas[2])
      return(out)
    }
    return(NULL)
  })

  output$contenido_archivo <- DT::renderDataTable({
    DT::datatable(output_df())
  })
  output$download_dataframe <- downloadHandler(
    filename = function(){
      paste("data-", Sys.Date(), ".csv", sep = "")
    },
    content = function(file){
      write.csv(output_df(), file)
    }
  )
})
