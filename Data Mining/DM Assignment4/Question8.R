options(warn=-1)

#install.packages("class")
library(class)

sonar_train <- read.csv("sonar_test.csv", header = FALSE)
sonar_test <- read.csv("sonar_test.csv", header = FALSE)

x_train = sonar_train[,1:60]
y_train = as.factor(sonar_train[,61])

x_test = sonar_test[,1:60]
y_test = as.factor(sonar_test[,61])

help("knn")
model1<-knn(x_train, x_test,y_train, k = 5) 
1 - sum(y_test == model1) / length(y_test) 

model2<-knn(x_train, x_test, y_train, k = 6)
1 - sum(y_test == model2) / length(y_test) 