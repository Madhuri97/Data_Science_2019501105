setwd("C:\\Users\\M. LAKSHMI MADHURI\\Desktop\\Repositories\\Data_Science_2019501105\\Data Mining\\Final exam")
options(warn=-1)
data = read.csv("Apriori_Data.csv", header = TRUE);
View(data)
data$TID <- NULL
library(arules)

write.csv(data, "ItemSets.csv", quote = FALSE, row.names = TRUE)
transactions = read.transactions("ItemSets.csv", sep=',', rm.duplicates = TRUE)
inspect(transactions)

frequent_itemsets <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="frequent itemsets"))

inspect(sort(frequent_itemsets)[1:15])

itemFrequencyPlot(transactions, topN = 5, col = "lightblue")