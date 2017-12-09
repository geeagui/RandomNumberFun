# server Random Number Fun
#

library(shiny)

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    set.seed(2017-12-07)
    number_of_points <- input$numeric
    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    repl <- ifelse(input$replacement,TRUE,FALSE)
    dataX <- sample(minX:maxX,number_of_points,replace=repl)
    dataY <- sample(minY:maxY,number_of_points,replace=repl)
    xlab <- ifelse(input$show_xlab,"X Axis","")
    ylab <- ifelse(input$Show_ylab,"Y Axis","")
    main <- ifelse(input$show_title, "Random Numbers Plot - with number tracer","")
    tracer <- input$tracer
    plot(dataX,dataY,xlab=xlab,ylab=ylab,main=main,xlim=c(-1000,1000),ylim=c(-1000,1000),col=ifelse(dataX==tracer|dataY==tracer,"red",ifelse(dataX%%2==0|dataY%%2==0,"green","light blue")),pch=ifelse(dataX==tracer|dataY==tracer,8,1),cex=ifelse(dataX%%2==0|dataY%%2==0,1,2))
  })
  output$plot2 <- renderPlot({
    set.seed(2017-12-07)
    number_of_points <- input$numeric
    minX <- input$sliderX[1]
    maxX <- input$sliderX[2]
    minY <- input$sliderY[1]
    maxY <- input$sliderY[2]
    repl <- ifelse(input$replacement,TRUE,FALSE)
    dataX <- sample(minX:maxX,number_of_points,replace=repl)
    dataY <- sample(minY:maxY,number_of_points,replace=repl)
    xlab <- ifelse(input$show_xlab,"X Axis","")
    ylab <- ifelse(input$Show_ylab,"Y Axis","")
    main <- ifelse(input$show_title, "Random Numbers Plot - with number tracer","")
    tracer <- input$tracer
    xbins <- seq(min(dataX),max(dataX),length.out=input$bins+1)
    ybins <- seq(min(dataY),max(dataY),length.out=input$bins+1) 
    par(mfrow=c(2,1))
    hist(dataX,breaks=xbins,col=rainbow(7),main=main,xlab=xlab,ylab=ylab,las=2,xlim=c(-1000,1000),ylim=c(0,mean(dataX)+50))
    points(tracer,pch=8)
    hist(dataY,breaks=ybins,col=terrain.colors(7),main=main,xlab=xlab,ylab=ylab,las=2,xlim=c(-1000,1000),ylim=c(0,mean(dataY)+50))
    points(tracer,pch=8)
  })
})
