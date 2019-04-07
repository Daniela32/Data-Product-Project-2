#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {

  # Nutritional markers include body mass index, basal metabolic rate and ideal weight, based on waist and neck circumferences and gender
  # References:
  # https://www.calculator.net/bmi-calculator.html
  # https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5787633/
  
  
  output$results <- renderText({
    bmi = round(input$mass/(input$height/100)^2, 1) #Body Mass Index
    
    # Basal metabolic rate (BMR) calculated as per Mifflin-St Jeor Equation
    if (input$Gender=="Male") bmr = 10*input$mass+6.25*input$height-5*input$age+5
    else bmr= 10*input$mass+6.25*input$height-5*input$age-161
    
    #Ideal weight calculated as per D.R. Miller formula
    if (input$Gender=="Male") iw = 56.2+1.41*((input$height-152.4)/2.54)
    else iw= 53.1+1.36*((input$height-152.4)/2.54)
  
    neck = input$neck
    waist = input$waist
    Gender = input$Gender
    
      if      (bmi <  18.5 & neck < 34.8 & waist < 78 & Gender == "Male") condition = "<span style='color: blue'>Underweight</span>"
      else if (bmi <= 25.0 & neck < 36.7 & waist < 83.7 & Gender == "Male") condition= "<span style='color: green'>Normal</span>"
      else if (bmi <= 30.0 & neck < 39.8 & waist < 95.2 & Gender == "Male") condition = "<span style='color: orange'>Overweight</span>"
      else if (bmi <= 35.0 & neck < 40.9 & waist < 102.3 & Gender == "Male") condition= "<span style='color: orange'>Moderately obese</span>"
      else if (bmi <= 40.0 & neck < 41.1 & waist < 110.7 & Gender == "Male") condition= "<span style='color: red'>Severely obese</span>"
      else if (bmi > 40.0 & neck < 41.8 & waist < 113.4 & Gender == "Male") condition = "<span style='color: red'>Very Severely obese</span>"
      else if (bmi <  18.5 & neck < 32.2 & waist < 67.4 & Gender == "Female") condition = "<span style='color: blue'>Underweight</span>"
      else if (bmi <= 25.0 & neck < 33.5 & waist < 74.6 & Gender == "Female") condition= "<span style='color: green'>Normal</span>"
      else if (bmi <= 30.0 & neck < 35.7 & waist < 85.8 & Gender == "Female") condition = "<span style='color: orange'>Overweight</span>"
      else if (bmi <= 35.0 & neck < 37.9 & waist < 96.6 & Gender == "Female") condition= "<span style='color: orange'>Moderately obese</span>"
      else if (bmi <= 40.0 & neck < 40 & waist < 104.3 & Gender == "Female") condition = "<span style='color: red'>Severely obese</span>"
      else if (bmi > 40.0 & neck < 41.0 & waist < 110.1 & Gender == "Female") condition = "<span style='color: red'>Very Severely obese</span>"
      else                  condition = "Check your input"
    paste("Body Mass Index: ", "<strong>", bmi, "</strong>", ", indicanting: ", condition, "<br>", "<br>",
           "Basal Metabolic Rate (# of calories to consume per day): ", bmr, "<br>", "<br>",
           "Ideal Weight, in kg (valid only if height > 156 cm): ",round(iw, digits=2)
           
    )
  })
  

})
