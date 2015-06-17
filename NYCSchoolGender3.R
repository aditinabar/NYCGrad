setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()
library(ggplot2)


NYC = read.table("Grad_by_SchoolGender.csv", sep = ",", header = TRUE, stringsAsFactor = TRUE, quote = "\"")
row.names(NYC) <- NULL

#copy
data <- NYC

data$Total.Regents.Num <- NULL

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, data$Total.Grads.Pct.of.cohort)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

data$Total.Grads.Pct.of.cohort <- repS

#format numeric values in Total.Grads.Num
repS <- gsub("s", NA, data$Total.Grads.Num)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

data$Total.Grads.Num <- repS

# #write 'data' to file 
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
  return(datasub3)
}


data.2004 = chunkbyYearMonth(data = data, year = '2004', month = 'June', category = '4')
data.2005 = chunkbyYearMonth(data = data, year = '2005', month = 'June', category = '4')
data.2006 = chunkbyYearMonth(data = data, year = '2006', month = 'June', category = '4')
data.2007 = chunkbyYearMonth(data = data, year = '2007', month = 'June', category = '4')


chunkbyMonth <- function(data, month, category){
  # takes data.frame data, number year, and string year
  # use grep to search for whatever month I give it; subset by month
    datasub2 <- data[grep(paste0("*", month),
                            data$Cohort.Category),]
  # check if category is "*", else, append "*"
  if(category == "*"){
    catstring = category
  } else{
    catstring = paste0("^", category)
  }
  datasub3 <- datasub2[grep(catstring, 
                            datasub2$Cohort.Category),]
  row.names(datasub3) <- NULL
  return(datasub3)
}

june <- chunkbyMonth(data = data, month = 'June', category = '4')


#build df for ggplot

dff <- data.frame(Year = levels(factor(june$Cohort.Year)),
                 Demographic = c("Female",  
                                 "Female", 
                                 "Female", 
                                 "Female", 
                                 "Female", 
                                 "Female",
                                 "Female"),
                 MeanPct = NA)

dfm <- data.frame(Year = levels(factor(june$Cohort.Year)),
                     Demographic = c("Male",  
                                     "Male", 
                                     "Male", 
                                     "Male", 
                                     "Male", 
                                     "Male",
                                     "Male"),
                     MeanPct = NA)

row.names(df) <- NULL

# Female
data_fem <- june[(june$Demographic == "Female"),]
tapp <- tapply(data_fem$Total.Grads.Pct.of.cohort, data_fem$Cohort.Year, mean, na.rm = TRUE)
tapp_fem <- data.frame(Year = names(tapp), value = tapp)
row.names(tapp_fem) <- NULL
tapp_fem[,"Demographic"] <- "Female"
tapp_fem <- tapp_fem[,c(1,3,2)]

# Male
data_male <- june[(june$Demographic == "Male"),]
tapp <- tapply(data_male$Total.Grads.Pct.of.cohort, data_male$Cohort.Year, mean, na.rm = TRUE)
tapp_male <- data.frame(Year = names(tapp), value = tapp)
row.names(tapp_male) <- NULL
tapp_male[,"Demographic"] <- "Male"
tapp_male <- tapp_male[,c(1,3,2)]

# Merge  Female and Male
little_d <- rbind(tapp_fem, tapp_male)
little_d <- little_d[order(little_d$Year),]
row.names(little_d) <- NULL
names(little_d)[3] <- "MeanPct"

View(little_d)
