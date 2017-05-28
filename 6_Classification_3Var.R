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
library(C50)
library(stats)
library(class)

t1 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Training.xlsx",1)

t2 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Testing.xlsx",1)

t1$cat[t1$quality <= 5] <- "low"
t1$cat[t1$quality == 6] <- "mid"
t1$cat[t1$quality > 6] <- "high"

t2$cat[t2$quality <= 5] <- "low"
t2$cat[t2$quality == 6] <- "mid"
t2$cat[t2$quality > 6] <- "high"

write.xlsx(x = t1,file="Training_class.xlsx",sheetName = "Sheet1", row.names = FALSE)

write.xlsx(x = t2,file="Testing_class.xlsx",sheetName = "Sheet1", row.names = FALSE)


t1 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Training_class.xlsx",1)

t2 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Testing_class.xlsx",1)

# C5.0 Classification (62.5%) all(68.33%) 6 variables(64.72%)
#model <- C5.0(quality ~ alcohol + sulphates + volatile.acidity + density,data=t1)
model <- C5.0(quality ~ alcohol + sulphates + volatile.acidity + pH + citric.acid + total.sulfur.dioxide,data=t1)
summary(model)
res <- predict(object=model,newdata=t2,type="class")
table(res,t2$quality)

# SVM classification (65.27%) 6variables(68.055%) all(68.055%)
#model <- svm(quality ~ alcohol + sulphates + volatile.acidity + density,data=t1)
model <- svm(quality ~ alcohol + sulphates + volatile.acidity + pH + citric.acid + total.sulfur.dioxide,data=t1)
results <- predict(object=model, newdata = t2,type="class")
table(results,t2$quality)

# CART Classification (67.22%) all(62.22%) 6variables(62.22%)
#model <- rpart(quality ~ alcohol + sulphates + volatile.acidity + density,data=t1)
model <- rpart(quality ~ alcohol + sulphates + volatile.acidity + pH + citric.acid + total.sulfur.dioxide,data=t1)
res <- predict(object=model,newdata=t2,type="class")
table(res,t2$quality)








