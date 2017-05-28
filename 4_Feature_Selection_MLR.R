library(xlsx)
library(corrplot)
library(lattice)
library(ggplot2)
library(caret)
library(rpart)
library(rpart.plot)
library(randomForest)
library(ineq)
library(mlbench)

mydata = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_high/outlier_free1.xlsx",1)

summary(mydata)

n = nrow(mydata)

train = sample(1:n, size = round(0.7*n),replace = FALSE)
t1 = mydata[train,]
t2 = mydata[-train,]

n1 = nrow(t1)
n2 = nrow(t2)

write.xlsx(x = t1,file="Training.xlsx",sheetName = "Sheet1", row.names = FALSE)
write.xlsx(x = t2,file="Testing.xlsx",sheetName = "Sheet1", row.names = FALSE)

# Import t1 and t2 now

t1 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Training.xlsx",1)

t2 = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/new_f/Testing.xlsx",1)


a2 <- step(lm(quality ~1, t1),scope=list(lower=~1,upper=~fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide + total.sulfur.dioxide + pH + sulphates + alcohol),direction="forward")

model <- lm(quality ~alcohol + sulphates + volatile.acidity + pH + citric.acid + total.sulfur.dioxide,data=t1)

summary(model)
par(mfrow=c(2,2))
plot(model)

#11,10,2,9,3,7
# 2,8,10,11

x_data <- t2[,c(2,3,7,9,10,11,12)]
new_p <- predict(model,newdata=x_data)




