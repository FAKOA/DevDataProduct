library(caret)
palette(c("#E42A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))

shinyServer(function(input, output, session) {
        
        # Combine the selected variables into a new data frame
        selectedData <- reactive({
                mtcars[, c(input$xcol, input$ycol)]
        })
        
        clusters <- reactive({
                kmeans(selectedData(), input$clusters)
        })
        
        output$plot1 <- renderPlot({
                par(mar = c(5.1, 4.1, 0, 1))
                plot(selectedData(),
                     col = clusters()$cluster,
                     pch = 20, cex = 3)
                points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
        })
        output$plot2 <- renderPlot({
                hist(mtcars[,input$ycol],breaks = 20)
        })
        output$head <- renderTable(head(mtcars))
        output$str2 <- renderTable(summary(mtcars))
        output$names <- renderText(names(mtcars))
        
})
options(tz="Africa/Douala")