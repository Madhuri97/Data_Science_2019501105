setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment5")
options(warn=-1)

x1<-c(1,2,3,6) 
x2<-c(5,10,4,12)
dist = ((x1[1] - x2[1]) ^ 2 + (x1[2] - x2[2]) ^ 2 + (x1[3] - x2[3]) ^ 2 + (x1[4] - x2[4]) ^ 2) ^ 0.5
print(dist)