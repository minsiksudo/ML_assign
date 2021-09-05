#git url
#https://github.com/minsiksudo/ML_assign.git

#Git upload update
#Machine Learning course_Coursea
rm(list=ls())
library(lattice)
library(ggplot2)
library(caret)
library(rpart)
testset<-read.csv("/Users/MK1059/Downloads/pml-testing.csv")
trainset<-read.csv("/Users/MK1059/Downloads/pml-training.csv")
set.seed(1)
inTrain <- createDataPartition(trainset$classe, p = 0.7, list = FALSE)
Train <- trainset[inTrain,]
Test <- trainset[-inTrain,]
fit1 <- rpart(classe ~ num_window, data=Train, method = "class", cp = 0.0025)


predict(fit, testset, type = "class")

#Generating factor..
test_rpart <- predict(fit1, Test, type = "class")
conf_result <- confusionMatrix(as.factor(Test$classe), test_rpart)
conf_result$table

#The prediction result is great. 
