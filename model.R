predict_function <- function(x) {
  # Load the trained model
  model <- readRDS("/mnt/code/linear_model.rds")
  
  # Create a data frame with the correct predictor name
  newdata <- data.frame(x = x)
  
  # Ensure using the correct predict function for 'lm' class
  prediction <- stats::predict(model, newdata = newdata)
  
  # Introduce slight variability by adding a small random noise
  noise <- rnorm(1, mean = 0, sd = 0.5)  # Adjust the standard deviation to control variability
  prediction <- prediction + noise
  
  return(list(prediction = prediction))
}

# Example usage with a custom x value, e.g., 3.5
single_prediction_result <- predict_function(3.5)
print(single_prediction_result)
