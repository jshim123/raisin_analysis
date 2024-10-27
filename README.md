Installation
  1. Visit R Project website
  2. Click the CRAN link under downloads and select a USA mirror
  3. Download base package for Windows

Packages
  1. caret: Classification and REgression Training, a comphrensive package for training machine learning models
  2. ellipse: Used for viusalizing data points and drawing ellipses around clusters to represent data concentration

Data Partitioning
  1. Dataset was split into 85% training data and 15% for validation using care

Model Training and Selection
  1. We trained four classification algorithms: LDA, RF, KNN, and CART. The models were evaluated using 10-fold cross-validation, and Random Forest (RF) emerged as the best model based on the highest mean accuracy and kappa value. This indicates a strong correlation between the predicted and actual classifications.

Dataset
  1. Used a public dataset from UC Irvine's Machine Learning Repository. Chose the Raisin dataset which contained over 900 images, each with 7 extracted features used for classifcation tasks. The format of the dataset was a CSV file
