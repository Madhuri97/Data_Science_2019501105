setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment5")
options(warn=-1)

data <- read.csv("sonar_test.csv", header = FALSE)
x <- data[,1:2]
plot(x, pch=19, xlab = expression(x[1]), ylab = expression(x[2]))

fit <- kmeans(x, 2)
points(fit$centers, pch = 19, col = "green", cex = 2)

library(class)
knnfit <- knn(fit$centers, x, as.factor(c(-1, 1)))
points(x, col = 4 + 5 * as.numeric(knnfit), pch = 19)

# Misclassification error rate
plot(x, pch = 19, xlab = expression(x[1]), ylab = expression(x[2]), col = "blue")
y <- data[,61]
points(x, col = 2 + 2 * y, pch = 19)

errorrate <- 1 - sum(knnfit == y) / length(y)
errorrate

x <- data[, 1:60]
fit <- kmeans(x, 2)

library(class)
knnfit <- knn(fit$centers, x, as.factor(c(-1, 1)))
1 - sum(knnfit == y) / length(y)