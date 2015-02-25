setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()
library(ggplot2)


NYC = read.csv("Grad_by_SchoolGender.csv", header = TRUE)
#copy
data <- NYC

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, data$Total.Grads.Pct.of.cohort)
repS <- gsub("%", "", repS)
as.numeric(repS)
repS <- as.numeric(repS)

data$Total.Grads.Pct.of.cohort <- repS

#format numeric values in Total.Grads.Num
repS <- gsub("s", NA, data$Total.Grads.Num)
repS <- gsub("%", "", repS)
as.numeric(repS)
repS <- as.numeric(repS)

data$Total.Grads.Num <- repS

#subset data: 2006, Female Male
data.2006 <- subset(data, data$Cohort.Year == 2006)
table(data$Cohort.Category, data$Cohort.Year)
tapply(data.2006$Total.Grads.Pct.of.cohort, data.2006$Cohort.Category, mean, na.rm = TRUE)
Fem2006 <- subset(data.2006, data.2006$Demographic == "Female")
Male2006 <- subset(data.2006, data.2006$Demographic == "Male")

tapply(Fem2006$Total.Grads.Pct.of.cohort, Fem2006$Cohort.Category, mean, na.rm = TRUE)
tapply(Male2006$Total.Grads.Pct.of.cohort, Male2006$Cohort.Category, mean, na.rm = TRUE)

tapply(Fem2006$Total.Grads.Num, Fem2006$Cohort.Category, mean, na.rm = TRUE)
tapply(Male2006$Total.Grads.Num, Male2006$Cohort.Category, mean, na.rm = TRUE)
