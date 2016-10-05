library(shiny)
shinyUI(fluidPage(
  titlePanel('BMI Calculator'),
  sidebarLayout(
    sidebarPanel(
      numericInput('height', 'Enter your height in cm', 170, min = 50, max = 100, step = 10),
      numericInput('weight', 'Enter your weight in kg', 60) ,
      submitButton('Calculate BMI'),
      plotOutput("plot1")
    ),
    mainPanel(tags$div(
      tags$ul(
        tags$li('BMI <18.5       : Underweight'),
        tags$li('BMI [18.5-24.9] : Normal weight'),
        tags$li('BMI [25-29.9]   : Overweight'),
        tags$li('BMI >=30        : Obesity')
      )
    ),
    h4('Calculating your BMI:'), 
    p('Weight(kg):'), verbatimTextOutput("inputweightvalue"),
    p('Height(cm):'), verbatimTextOutput("inputheightvalue"),
    h4('Your BMI is:'), verbatimTextOutput("estimation"),
    p('You are:'), verbatimTextOutput("diagnostic")
    
    )
  )
)

)


