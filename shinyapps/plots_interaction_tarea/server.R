library(shiny)
library(dplyr)
library(ggplot2)

selected_click <- NULL
selected_hover <- NULL
selected_brush <- NULL

shinyServer(function(input, output) {
  
  observeEvent(input$action_btn, {
    selected_click <<- NULL
    selected_hover <<- NULL
    selected_brush <<- NULL
    output$mtcars_tbl <- DT::renderDataTable({mtcars %>% DT::datatable()})
    output$plot_click_options <- renderPlot({scatter_plot()})
  })
  
  points_selected <- reactive({
    if(!is.null(input$mouse_hover$x)){
      df <- nearPoints(mtcars,input$mouse_hover,xvar='wt',yvar='mpg')
      selected_hover <<- df
    }
    if(!is.null(input$clk$x)){
      df <- nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
      selected_click <<- rbind(selected_click,df) %>% distinct()
      output$mtcars_tbl <- DT::renderDataTable({df %>% DT::datatable()})
    }
    if(!is.null(input$dclk$x)){
      df <- nearPoints(mtcars,input$dclk,xvar='wt',yvar='mpg')
      selected_click <<- setdiff(selected_click,df)
      selected_brush <<- setdiff(selected_brush,df)
    }
    if(!is.null(input$mouse_brush)){
      df<-brushedPoints(mtcars,input$mouse_brush,xvar='wt',yvar='mpg')
      selected_brush <<- rbind(selected_brush,df) %>% distinct()
      output$mtcars_tbl <- DT::renderDataTable({df %>% DT::datatable()})
    }
  })
  
  scatter_plot <- reactive({
    plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="mpg")
    points_selected <-points_selected()
    if(!is.null(selected_hover)){
      points(selected_hover[,'wt'],
             selected_hover[,'mpg'],
             col = 'gray',
             pch = 16,
             cex= 2)
    }
    if(!is.null(selected_click)){
      points(selected_click[,'wt'],
             selected_click[,'mpg'],
             col = 'green',
             pch = 16,
             cex= 2)
    }
    if(!is.null(selected_brush)){
      points(selected_brush[,'wt'],
             selected_brush[,'mpg'],
             col = 'red',
             pch = 16,
             cex= 2)
    }
  })
  
  output$plot_click_options <- renderPlot({scatter_plot()})
  
  output$click_data <- renderPrint({
    rbind(c(input$clk$x,input$clk$y),
          c(input$dclk$x, input$dclk$y),
          c(input$mouse_hover$x, input$mouse_hover$y),
          c(input$mouse_brush$xmin,input$mouse_brush$ymin),
          c(input$mouse_brush$xmax,input$mouse_brush$ymax)
          )
  })
  
  output$mtcars_tbl <- DT::renderDataTable({mtcars %>% DT::datatable()})

})
