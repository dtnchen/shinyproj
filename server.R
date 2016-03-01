library(dplyr)
library(shiny)

# Read in data on app start
BMImen <- read.table("topmenBMI100000.csv")
BMIwomen <- read.table("topwomenBMI100000.csv")
WHRmen <- read.table("topmenWHR100000.csv")
WHRwomen <- read.table("topwomenWHR100000.csv")
HT <- read.table("topHT100000.csv")
BMIt <- read.table("topBMI100000.csv")

shinyServer(function(input, output,session) {
        
        # Take the top SNPs
        SNPs <- reactive({input$SNPs})
        
        # Combine the selected variables into a new data frame
        # select the data to input, returning a data frame of common_SNPs
        dataInput <- reactive({
                if (input$xvar == axis_vars[1]) x<-BMIt
                else if (input$xvar == axis_vars[2]) x<-HT
                else if (input$xvar == axis_vars[3]) x<-BMImen
                else if (input$xvar == axis_vars[4]) x<-BMIwomen
                else if (input$xvar == axis_vars[5]) x<-WHRmen
                else if (input$xvar == axis_vars[6]) x<-WHRwomen
                if (input$yvar == axis_vars[1]) y<-BMIt
                else if (input$xvar == axis_vars[2]) y<-HT
                else if (input$xvar == axis_vars[3]) y<-BMImen
                else if (input$xvar == axis_vars[4]) y<-BMIwomen
                else if (input$xvar == axis_vars[5]) y<-WHRmen
                else if (input$xvar == axis_vars[6]) y<-WHRwomen
                data <- inner_join(x,y,by="SNP")
                data <- as.data.frame(data)
                data
        })
        
       
        # Filter the movies, returning a data frame
        SNPdata <- reactive({
                # Due to dplyr issue #318, we need temp variables for input values
               
                # Apply filters
                m <- dataInput() %>% slice(1:SNPs())
                m <- as.data.frame(m)
                m
        })
        
        output$plot1 <- renderPlot({
                plot(-log10(SNPdata()[,2:3]),xlab=input$xvar,ylab=input$yvar,col=rgb(0,100,0,50,maxColorValue=255), pch=20,cex=2)
        })
        
})