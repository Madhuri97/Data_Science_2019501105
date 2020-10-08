### Code sample
> setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment2\\")
> data <- read.csv("myfirstdata.csv", header = F)
> head(data)
V1 V2
1  0  0
2  0  3
3  0  1
4  1  2
5  0  0
6  1  2
> c(is.factor(data[, 1]), is.numeric(data[, 1]))
[1] FALSE  TRUE
> c(is.factor(data[, 2]), is.numeric(data[, 2]))
[1] FALSE FALSE
> 