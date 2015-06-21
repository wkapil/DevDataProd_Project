library(shiny)
shinyUI(pageWithSidebar(
  headerPanel('Developing Data Products - Project'),
  sidebarPanel(
    h3('Instructions'),
    p('Enter the values for Horsepower, Cylinders count, and weight of  
      car below.  The result will be predicted MPG.'),
    h3('Please enter predictors of MPG below.'),
    numericInput('hp', 'Horsepower:', 200, min = 50, max = 330, step = 10), # numeric input
    radioButtons('cyl', 'Cylinders:', c('4' = 4, '6' = 6, '8' = 8), selected = '6'), # radio button input
    numericInput('wt', 'Weight (lbs):', 3200, min = 1500, max = 5500, step = 100)
    ),
  mainPanel(
    h6('Developing Data Products - Project by Kapil Wadodkar'),
    h3('Predicted MPG'),
    h4('Values entered:'),
    verbatimTextOutput("inputValues"),
    h4('Prediction Result:'),
    verbatimTextOutput("prediction"),
    h4('MPG relative to cars in mtcars data set'),
    plotOutput('plots'),
    h3('Method'),
    p('With mtcars dataset and liner modeling the effect of 
      horsepower, number of cylinders, and weight on the mpg.  Restricting 
      cylinder selection to 4, 6, and 8 with radio buttons.  For the weight,
      reactive() is used to convert the user input weight into the units 
      used by the model, lb/1000.  A linear model function is used to 
      predict the mpg based on the three variables 
      input by the user.'),
    p('Ref: mtcars dataset - https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/mtcars.html')
    )
  ))