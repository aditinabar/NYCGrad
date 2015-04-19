setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()
library(ggplot2)


NYC = read.table("Grad_by_SchoolGender.csv", sep = ",", header = TRUE, stringsAsFactor = TRUE)

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
#write.csv(data, file = "NYC_Clean.csv", row.names = FALSE)

# Declare a function that will chunk the dataset by year and month

chunkbyYearMonth <- function(data, year, month, category){
  # takes data.frame data, number year, and string year
  # subset by year
  datasub1 <- subset(data, (data$Cohort.Year == year))
  # use grep to search for whatever month I give it; subset by month
  datasub2 <- datasub1[grep(paste0("*", month),
                            datasub1$Cohort.Category),]
  # check if category is "*", else, append "*"
  if(category == "*"){
    catstring = category
  } else{
    catstring = paste0("^", category)
  }
  datasub3 <- datasub2[grep(catstring, 
                            datasub2$Cohort.Category),]
  row.names(datasub3) <- NULL
  print(catstring)
  return(datasub3)
}

datasubs = list()

# loop through the years or years&months and create your datasets

# for(i in names(table(data$Cohort.Year))){
#   datasubs[paste0("Y",i)] = chunkbyYearMonth(data = data, year = i, month = "June", category = "4 Year") 
#   print(paste("Did", i))
# }

data.2004 = chunkbyYearMonth(data = data, year = '2004', month = 'June', category = '4')
data.2005 = chunkbyYearMonth(data = data, year = '2005', month = 'June', category = '4')
data.2006 = chunkbyYearMonth(data = data, year = '2006', month = 'June', category = '4')
data.2007 = chunkbyYearMonth(data = data, year = '2007', month = 'June', category = '4')

#subset data: 4-year-June
# data.2001 <- subset(data, (data$Cohort.Year == 2001 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2001) <- NULL
# data.2002 <- subset(data, (data$Cohort.Year == 2002 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2002) <- NULL
# data.2003 <- subset(data, (data$Cohort.Year == 2003 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2003) <- NULL
# data.2004 <- subset(data, (data$Cohort.Year == 2004 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2004) <- NULL
# data.2005 <- subset(data, (data$Cohort.Year == 2005 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2005) <- NULL
# data.2006 <- subset(data, (data$Cohort.Year == 2006 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2006) <- NULL
# data.2007 <- subset(data, (data$Cohort.Year == 2007 & 
#                              data$Cohort.Category == grep("*June", data$Cohort.Category, value = TRUE)))
# row.names(data.2007) <- NULL

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
#J2006.lt50 <- subset(Jdata.2006, Jdata.2006$Total.Grads.Pct.of.cohort < 50)

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


