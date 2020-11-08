setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\Final exam")
options(warn=-1)

data = read.csv("Liver_Data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks", "selector"))

#converting the decision attribute into classes
data$drinks = cut(data$drinks, breaks = c(0,5,10,15,20,25), labels = c('C1', 'C2', 'C3', 'C4', 'C4'), right = FALSE)
data = na.omit(data)

#training and test sets
traindata = subset(data, data$selector == 1)
testdata = subset(data, data$selector == 2)

x_train <- subset(traindata, select = -c(selector, drinks))
x_test <- subset(testdata, select = -c(selector, drinks))

y_train = traindata[,6, drop = TRUE]
y_test = testdata[,6, drop = TRUE]


#For Training Data KNN
#k=1
library(class)
model1 = knn(x_train, x_test, y_train, k = 1)
1-sum(y_train==model1)/length(y_train) 

#k=2
model2 = knn(x_train, x_train, y_train, k = 2)
1-sum(y_train==model2)/length(y_train) 

#k=3
model3 = knn(x_train, x_train, y_train, k = 3)
1-sum(y_train==model3)/length(y_train) 


#For Test Data KNN
#k=1
model4 = knn(x_train, x_test, y_train, k = 1)
1-sum(y_test==model4)/length(y_test) 

#k=2
model5 = knn(x_train, x_test, y_train, k = 2)
1-sum(y_test==model5)/length(y_test) 

#k=3
model6 = knn(x_train, x_test, y_train, k = 3)
1-sum(y_test==model6)/length(y_test)