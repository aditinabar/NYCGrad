setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()

NYC = read.csv("Grad_by_SchoolGender.csv", header = TRUE)

head(NYC)
tail(NYC)

year2004 = subset(NYC,  grepl("2004", NYC$Cohort.Year))

head(year2004)
