setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment4")
options(warn=-1)

#install.packages("randomForest")
library("randomForest")
sonar_train <- read.csv("sonar_test.csv", header = FALSE)
sonar_test <- read.csv("sonar_test.csv", header = FALSE)

x_train = sonar_train[,1:60]
y_train = as.factor(sonar_train[,61])

x_test = sonar_test[,1:60]
y_test = as.factor(sonar_test[,61])

model<-randomForest(x_train, y_train)
1 - sum(y_train == predict(model, x_train)) / length(y_train)