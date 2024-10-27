# Load necessary libraries
library(caret)
library(ellipse)

# Load the data
data <- read.csv("raisin.csv", header = TRUE, sep = ",")

# Convert Class to a factor
data$Class <- as.factor(data$Class)

# Create training and validation sets
set.seed(6)
training <- createDataPartition(data$Class, p = 0.85, list = FALSE)
validationset <- data[-training, ]
dataset <- data[training, ]

# Ensure dataset is a data frame
dataset <- as.data.frame(dataset)

# Print the structure of dataset to confirm it's a data frame
str(dataset)

# Define control and metric for classification
control <- trainControl(method = "cv", number = 10)
metric <- "Accuracy"

# Train classification models
fit.lda <- train(Class ~ ., data = dataset, method = "lda", metric = metric, trControl = control)
fit.rf <- train(Class ~ ., data = dataset, method = "rf", metric = metric, trControl = control)
fit.knn <- train(Class ~ ., data = dataset, method = "knn", metric = metric, trControl = control)
fit.cart <- train(Class ~ ., data = dataset, method = "rpart", metric = metric, trControl = control)

# Summarize results
results <- resamples(list(lda = fit.lda, rf = fit.rf, knn = fit.knn, cart = fit.cart))
summary(results)

# Manually determine the most accurate model from the summary output
# For example, if Random Forest (RF) is the most accurate:
fit.model <- fit.rf  # Replace fit.rf with the most accurate model identified

# Make predictions on the validation set
predictions <- predict(fit.model, validationset)

# Evaluate the predictions
confusionMatrix(predictions, validationset$Class)

