setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\Final exam")
options(warn=-1)

data = read.csv("BSE_Sensex_Index.csv", header = TRUE)

summary(data)
data$Date = as.Date(data$Date, format = '%m/%d/%Y')

successive_diff <- function(x) {
  n = length(x)
  for (i in 1:(length(x))) {
    x[i] <- (x[i] - x[i + 1]) / x[i + 1]
  }
  x[length(x)] = (x[length(x) - 1] + x[length(x) - 2] + x[length(x) - 3]) / 3
  return(x)
}

data$successive_growth <- successive_diff(data$Close)

#calculating z-scores
sgrmean <- mean(data$successive_growth, na.rm = TRUE)
sgrsd <- sd(data$successive_growth,na.rm = TRUE)
z<-(data$successive_growth - sgrmean) / sgrsd
sort(z)
data$zscores <- z

#Dates of the outliers 
dates <- subset(data[,1],data[,"zscores"] >= 3.0 | data[,"zscores"] <= -3.0)
print(dates)

#Storing 
write.csv(dates, "DateOutliersData.csv", quote = FALSE, row.names = TRUE)
