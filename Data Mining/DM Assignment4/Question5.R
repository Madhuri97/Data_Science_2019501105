setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment4")
getwd()
options(warn=-1)

sonar_train = read.csv("sonar_train.csv",header = FALSE)
sonar_test = read.csv("sonar_test.csv",header = FALSE)
summary(sonar_train)
dim(sonar_train)
summary(sonar_test)
dim(sonar_test)

library(rpart)
library(rpart.plot)
help("rpart.control")
help("rpart.plot")
x <- sonar_train[,1:60]
y <- as.factor(sonar_train[,61])
model <- rpart(y~.,x,control=rpart.control(minsplit=0, minbucket=0,cp=-1, maxcompete=0, maxsurrogate=0, usesurrogate=0, xval=0, maxdepth=5))
rpart.plot(model, box.palette="RdBu", shadow.col="black", nn=TRUE, border = "blue", col = "brown")

#plot(model)
#text(model)

x_test <- sonar_test[,1:60]
y_test <- as.factor(sonar_test[,61])
1 - sum(y_test == predict(model, x_test,type = "class")) / length(y_test)