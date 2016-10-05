library(shiny)
BMI<-function(weight,height) {weight/((height*0.01)^2)}
diagnostic_f<-function(weight,height){
  BMI_value<- weight/((height*0.01)^2)
  ifelse(BMI_value<18.5,"Underweight",ifelse(BMI_value<25,"Normal Weight",ifelse(BMI_value<30,"Overweight","Obesity")))
}
shinyServer(function(input, output){
  output$inputweightvalue <- renderPrint({input$weight})
  output$inputheightvalue <- renderPrint({input$height})
  output$estimation <- renderPrint({BMI(input$weight,input$height)})
  output$diagnostic <- renderPrint({diagnostic_f(input$weight,input$height)})
  
  output$plot1 <- renderPlot(
    plot(input$weight,input$height, xlab = "Weight", ylab = "Height", xlim = c(0,150), ylim = c(0,280), col = "blue"))
})