library(e1071)
library(xlsx)
library(corrplot)
library(lattice)
library(ggplot2)
library(caret)
library(rpart)
library(rpart.plot)
library(randomForest)
library(ineq)

t1 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Training.xlsx",1)

t2 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Testing.xlsx",1)

#x_data <- t1[,c(2,8,10,11,12)]	# Model 2
#y_data <- t2[,c(2,8,10,11,12)] # Model 2

x_data <- t1[,c(2,3,7,9,10,11,12)] # Model 1
y_data <- t2[,c(2,3,7,9,10,11,12)] # Model 1

model <- svm(as.factor(quality) ~ .,data=x_data)
pred <- predict(model,newdata=y_data)
