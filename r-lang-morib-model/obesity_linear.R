# Install and load required packages
install.packages(c("tidyverse"))

library(shiny)
library(tidyverse)
library(targets)

# Define the data preprocessing plan using targets
tar_plan <- tar_script({
  # Load the dataset
  obesity_data <- read.csv("obesity_data.csv")
  print("This is a log message1")

  # Perform data preprocessing steps if needed
  # For example, handle missing values, transform variables, etc.
  
  # Save the preprocessed data
  tar_target(preprocessed_data, {
    # Return the preprocessed data
    return(obesity_data)
    print("This is a log message2")

  })
})

# Define the model training plan using targets
tar_train_model <- tar_script({
  # Load preprocessed data
  preprocessed_data <- tar_read(preprocessed_data)
  print("This is a log message3")

  # Define and train a simple linear regression model
  model <- lm(Mortality ~ Age + EthnicityRace + Geolocation + Income, data = preprocessed_data)
  print("This is a log message4")

  # Save the trained model
  tar_target(trained_model, {
    # Return the trained model
    return(model)
    print("This is a log message5")

  })
})

# Define the Shiny app
ui <- fluidPage(
  titlePanel("Mortality Prediction"),
  sidebarLayout(
    sidebarPanel(
      # Add input controls for age, ethnicity/race, geolocation, and income if needed
      print("This is a log message6")

    ),
    mainPanel(
      plotOutput("prediction_plot")
      print("This is a log message7")

    )
  )
)

server <- function(input, output) {
  # Load the trained model
  trained_model <- tar_read(trained_model)
  print("This is a log message8")

  # Define a reactive function for predictions
  predictions <- reactive({
    # Use input values and the trained model for predictions
    # For example: predict(trained_model, newdata = data.frame(Age = input$age, EthnicityRace = input$ethnicity, ...))
  })
  print("This is a log message9")

  # Update the plot based on predictions
  output$prediction_plot <- renderPlot({
    # Plot the predictions or any relevant visualization
    
  })print("This is a log message10")

}

# Run the Shiny app
shinyApp(ui, server)
print("This is a log message11")

