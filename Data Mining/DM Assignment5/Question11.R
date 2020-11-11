setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment5")
options(warn = -1)

exams <- read.csv("spring2008exams.csv")
str(exams)

mean1 <- mean(exams$Midterm.1, na.rm = TRUE)
sd1 <- sd(exams$Midterm.1, na.rm = TRUE)
z_score <- (exams$Midterm.1 - mean1) / sd1

sort(z_score)