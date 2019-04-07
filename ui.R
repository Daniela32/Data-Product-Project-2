#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  titlePanel("Nutritional Calculator - Obesity markers"),
  sidebarLayout(sidebarPanel(
    sliderInput(
      inputId = "height",
      label = strong("Input your height, in cm:"),
      min = 100,
      max = 250,
      value = 120
    ), #Height input slider
    sliderInput(
      inputId = "mass",
      label = strong("Input your weight, in kg:"),
      min = 20,
      max = 150,
      value = 75
    ), #Mass input slider
    sliderInput(
      inputId = "waist",
      label = strong("Input your waist circumference, in cm:"),
      min = 20,
      max = 150,
      value = 75
    ), #Waist input slider
    sliderInput(
      inputId = "neck",
      label = strong("Input your neck circumference, in cm:"),
      min = 20,
      max = 80,
      value = 40
    ), #Neck input slider
    sliderInput(
      inputId = "age",
      label = strong("Input your age, in years:"),
      min = 0,
      max = 100,
      value = 50
    ), #Age input slider
    selectInput("Gender", "Gender:",
                c("Female",
                  "Male")),
    h5(""),
    h6("")
  ),
  
  mainPanel(
    uiOutput("results")
  ))
))
