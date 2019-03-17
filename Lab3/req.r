#install.packages("arules", dependencies = TRUE)
#library("devtools")
#install_github("mhahsler/arulesViz")
#Req.2
library(arules)
library(arulesViz)
#Req.3
items <- read.transactions("AssociationRules.csv", header = TRUE)
items
#Req.4
df <- items[1:100,]
inspect(df,ruleSep = "---->")
#Req.5
summary(items)
head ( sort(itemFrequency(items, type = "relative"), decreasing = TRUE),2)
#Req.6
itemFrequencyPlot(items, topN=5, type="absolute", main="Item Frequency")
#Req.7
rules <- apriori(items, parameter = list (supp = 0.01, conf = 0.5, maxlen=2))
#Req.8
inspect (head(rules, n = 6L, by = "support", decreasing = TRUE))
#Req.9
inspect (head(rules, n = 6L, by = "confidence", decreasing = TRUE))
#Req.10
inspect (head(rules, n = 6L, by = "lift", decreasing = TRUE))
#Req. 11
plot(rules, measure = list("support", "confidence"), shading = "lift")
#Req.12

"Item13 is the most frequent items<- might be the most consumed product
It is mostly accompnyed with item5 (they both are the most frequent ones),
there is a relation between {item5, item13} and they aren't independent as lift >1
and {item55, item34} have the strongest relation, they occur together
and {item23} often occurs with {item13} but they aren't independent as well
"