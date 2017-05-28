library(xlsx)
library(corrplot)

mydata = read.xlsx("/Users/AjayKulkarni/Study/Master of Science/Sem 1/CSI 777/data/winequality/red_1.xlsx",1)


for(i in 1:12)
{
	t1 <- quantile(mydata[,i],0.75)
	t2 <- IQR(mydata[,i],0.75)
	limout[i] <- t1 + 1.5*t2
}

index <- matrix(0,1599,12)

for(i in 1:1599)
for(j in 1:12)
{
	if(mydata[i,j]>limout[j]) index[i,j] <- 1
}

wwind <- apply(index,1,sum)
wwtemp <- cbind(wwind, mydata)

ind <- rep(0,208)

j <- 1

for(i in 1:1599)
{
	{
		if(wwind[i]>0 ) {ind[j] <- i}
		j <- j + 1
	}
	else j <- j
}

lib <- mydata[-ind,]
ind = sample(1:nrow(lib, size=0.5*nrow(lib)))
train <- lib[ind,]
test <- lib[-ind,]