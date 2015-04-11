setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()
library(ggplot2)


NYC = read.table("Grad_by_SchoolGender.csv", header = TRUE, stringAsFactor = TRUE)

NycC = read.csv("NYC_Clean.csv", header = TRUE)
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

#write 'data' to file 
write.csv(data, file = "NYC_Clean.csv", row.names = FALSE)

#subset data: 2006, Female Male
data.2001 <- subset(data, c(data$Cohort.Year == 2001, 
                            data$Cohort.Category == "*June"))
row.names(data.2001) <- NULL
data.2002 <- subset(data, data$Cohort.Year == 2002)
data.2003 <- subset(data, data$Cohort.Year == 2003)
data.2004 <- subset(data, data$Cohort.Year == 2004)
data.2005 <- subset(data, data$Cohort.Year == 2005)
data.2006 <- subset(data, data$Cohort.Year == 2006)
data.2007 <- subset(data, data$Cohort.Year == 2007)

table(data$Cohort.Category, data$Cohort.Year)
tapply(data.2006$Total.Grads.Pct.of.cohort, 
       data.2006$Cohort.Category, mean, na.rm = TRUE)
Fem2006 <- subset(data.2006, data.2006$Demographic == "Female")
Male2006 <- subset(data.2006, data.2006$Demographic == "Male")

tapply(Fem2006$Total.Grads.Pct.of.cohort, Fem2006$Cohort.Category, mean, na.rm = TRUE)
tapply(Male2006$Total.Grads.Pct.of.cohort, Male2006$Cohort.Category, mean, na.rm = TRUE)

tapply(Fem2006$Total.Grads.Num, Fem2006$Cohort.Category, mean, na.rm = TRUE)
tapply(Male2006$Total.Grads.Num, Male2006$Cohort.Category, mean, na.rm = TRUE)

#plot histogram
J2006.lt50 <- subset(Jdata.2006, Jdata.2006$Total.Grads.Pct.of.cohort < 50)

g2 <- ggplot(J2006.lt50, aes(Total.Grads.Pct.of.cohort))
g2 + geom_histogram()

#boxplot
boxplot(data$Total.Grads.Pct.of.cohort[data$Demographic == "Female"], 
        data$Total.Grads.Pct.of.cohort[data$Demographic == "Male"], 
        ylab = "Grads as Percent of Cohort", names = c("Female", "Male"), 
        main = "Overall F v M")

#Overall Comparison
t.test(data$Total.Grads.Pct.of.cohort[data$Demographic == "Female"], 
       data$Total.Grads.Pct.of.cohort[data$Demographic == "Male"])


