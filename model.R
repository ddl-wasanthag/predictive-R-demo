predict_inference <- function(x_value) {
  # Load the pre-trained model (assuming it's either an lm or train object)
  model_object <- readRDS("linear_model.rds")
  
  # Check if it's a train object and extract the finalModel if needed
  if ("train" %in% class(model_object)) {
    pretrained_model <- model_object$finalModel
  } else {
    pretrained_model <- model_object
  }
  
  # Ensure the input is a single x value, as a data frame
  new_data <- data.frame(x = x_value)
  
  # Perform inference (prediction) using the pre-trained model
  prediction <- predict(pretrained_model, new_data)
  
  # Print and return only the first prediction
  result <- data.frame(x = x_value, Prediction = prediction[1])
  
  print(result)
  
  return(result)
}

# Example usage with a custom x value, e.g., 2.5
single_prediction_result <- predict_inference(3.5)

