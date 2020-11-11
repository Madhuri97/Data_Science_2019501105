setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\DM Assignment5")
options(warn=-1)

for (k in 2:10){
  cluster1 <- x[abs(x - center1[k - 1]) <= abs(x - center2[k - 1])]
  cluster2 <- x[abs(x - center1[k - 1]) >  abs(x - center2[k - 1])]
  center1[k] <- mean(cluster1)
  center2[k] <- mean(cluster2)
}

print(cluster1)
print(cluster2)