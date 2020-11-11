setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment5")
options(warn = -1)

exams <- read.csv("spring2008exams.csv")

model <- lm(exams$Midterm.2 ~ exams$Midterm.1)

plot(exams$Midterm.1, exams$Midterm.2, pch = 19, xlab = "Exam 1", ylab = "Exam2", xlim = c(10, 100), ylim = c(10,100), col = "green")

abline(model)
sort(model$residuals)