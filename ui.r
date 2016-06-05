shinyUI(
        
        navbarPage(title = "mtcars K-means clustering",
                   tabPanel(title = "Settings",
                            selectInput('xcol', 'X Variable', names(mtcars)),
                            selectInput('ycol', 'Y Variable', names(mtcars),
                                        selected=names(mtcars)[[1]]),
                            numericInput('clusters', 'Cluster count', 3,
                                         min = 1, max = 9)
                   ),
                   navbarMenu(title = "Data summary",
                              tabPanel(title = "Head",
                                       tableOutput('head')
                                       
                              ),
                              tabPanel(title = "Names",
                                       textOutput('names')
                                       
                              ),
                              tabPanel(title = "Summary",
                                       tableOutput('str2')
                                       
                              ),
                   
                   tabPanel(title = "Histogram of y",
                            plotOutput('plot2')
                            
                            
                   )),
                    navbarMenu(title = "The results",                   
                              tabPanel(title = "Plot the classes",
                                       plotOutput('plot1')
                                       
                              
                    )
                   )
        )
)
