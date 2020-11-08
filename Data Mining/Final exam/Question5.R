options(warn=-1)
data = read.csv("Liver_data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks", "selector"))

data$drinks = cut(data$drinks, breaks = c(0,5,10,15,20,25), labels = c('C1', 'C2', 'C3', 'C4', 'C4'), right = FALSE)
data = na.omit(data)

#traing and test sets
traindata = subset(data, data$selector == 1)
testdata = subset(data, data$selector == 2)

x_train <- subset(traindata, select = -c(selector, drinks))
x_test <- subset(testdata, select = -c(selector, drinks))

y_train = traindata[,6, drop = TRUE]
y_test = testdata[,6, drop = TRUE]

library(e1071)

#training data
model = svm(x_train, y_train)
1-sum(y_train==predict(model,x_train))/length(y_train)

#test data 
1-sum(y_test==predict(model,x_test))/length(y_test)