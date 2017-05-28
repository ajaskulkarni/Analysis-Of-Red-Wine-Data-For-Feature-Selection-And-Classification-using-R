library(xlsx)
library(corrplot)

mydata = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/red_1.xlsx",1)

dsbase.iqr <- mydata

vars <- c("fixed.acidity","volatile.acidity","citric.acid","residual.sugar","chlorides","free.sulfur.dioxide","total.sulfur.dioxide","density","pH","sulphates","alcohol","quality")

outliers <- c()

for(i in vars)
{
	max <- quantile(dsbase.iqr[,i],0.75,na.rm=TRUE) + (IQR(dsbase.iqr[,i],na.rm=TRUE)*1.5)
	min <- quantile(dsbase.iqr[,i],0.75,na.rm=TRUE) - (IQR(dsbase.iqr[,i],na.rm=TRUE)*1.5)
	
	idx <- which(dsbase.iqr[,i] < min | dsbase.iqr[,i] > max)
	
	print(paste(i,length(idx),sep=''))
	
	outliers <- c(outliers,idx)
}

outliers <- sort(outliers)

dsbase <- dsbase.iqr[-outliers,]

