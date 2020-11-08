setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\Final exam")
options(warn=-1)
#1a
data = read.csv("BSE_Sensex_Index.csv", header = TRUE)

print(data)
summary(data)
data$Date = as.Date(data$Date, format = '%m/%d/%Y')

randomRows = function(df,n){
  return(df[sample(nrow(df), n, replace = TRUE),])
}

successive_diff <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

data$Date <- NULL

data$open_new <- successive_diff(data$Open)
data$high_new <- successive_diff(data$High)
data$low_new <- successive_diff(data$Low)
data$close_new <- successive_diff(data$Close)
data$volume_new <- successive_diff(data$Volume)
data$Adj.close_new <- successive_diff(data$Adj.Close)

set.seed(123)

d_1000 = randomRows(data, 1000)
summary(d_1000)
d_3000 = randomRows(data, 3000)
summary(d_3000)

#1b
#d_1000
mean(d_1000$open_new)
mean(d_1000$high_new)
mean(d_1000$low_new)
mean(d_1000$close_new)
mean(d_1000$volume_new)
mean(d_1000$Adj.close_new)
var(d_1000$open_new)
var(d_1000$high_new)
var(d_1000$low_new)
var(d_1000$close_new)
var(d_1000$volume_new)
var(d_1000$Adj.close_new)
max(d_1000$open_new)
max(d_1000$high_new)
max(d_1000$low_new)
max(d_1000$close_new)
max(d_1000$volume_new)
max(d_1000$Adj.close_new)
quantile(d_1000$open_new,0.25)
quantile(d_1000$high_new,0.25)
quantile(d_1000$low_new,0.25)
quantile(d_1000$close_new,0.25)
quantile(d_1000$volume_new,0.25)
quantile(d_1000$Adj.close_new,0.25)
#d_3000
mean(d_3000$open_new)
mean(d_3000$high_new)
mean(d_3000$low_new)
mean(d_3000$close_new)
mean(d_3000$volume_new)
mean(d_3000$Adj.close_new)
var(d_3000$open_new)
var(d_3000$high_new)
var(d_3000$low_new)
var(d_3000$close_new)
var(d_3000$volume_new)
var(d_3000$Adj.close_new)
max(d_3000$open_new)
max(d_3000$high_new)
max(d_3000$low_new)
max(d_3000$close_new)
max(d_3000$volume_new)
max(d_3000$Adj.close_new)
quantile(d_3000$open_new,0.25)
quantile(d_3000$high_new,0.25)
quantile(d_3000$low_new,0.25)
quantile(d_3000$close_new,0.25)
quantile(d_3000$volume_new,0.25)
quantile(d_3000$Adj.close_new,0.25)

#1c
mean(data$open_new)
mean(data$high_new)
mean(data$low_new)
mean(data$close_new)
mean(data$volume_new)
mean(data$Adj.close_new)
var(data$open_new)
var(data$high_new)
var(data$low_new)
var(data$close_new)
var(data$volume_new)
var(data$Adj.close_new)
max(data$open_new)
max(data$high_new)
max(data$low_new)
max(data$close_new)
max(data$volume_new)
max(data$Adj.close_new)
quantile(data$open_new,0.25)
quantile(data$high_new,0.25)
quantile(data$low_new,0.25)
quantile(data$close_new,0.25)
quantile(data$volume_new,0.25)
quantile(data$Adj.close_new,0.25)

#1d
boxplot(data$Open, data$High, data$Low, data$Adj.close, data$Close, col = "lightblue")

#1e
hist(data$Close, freq = TRUE, w = 2000, col = "lightblue")