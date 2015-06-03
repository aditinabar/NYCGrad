setwd("/Users/naditi/PycharmProjects/NYCGrad")

eth <- read.table("Graduation_Outcomes_by_SchoolLevel_Ethnicity_2005-2011.csv", sep = ",", 
                  header = TRUE, stringsAsFactor = TRUE)
row.names(eth) <- NULL
eth[,1] <- NULL

eth[8:19] <- list(NULL)

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, eth$Total.Grads.Pct.of.cohort)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Total.Grads.Pct.of.cohort <- repS

#format numeric values in Total.Grads.Num
repS <- gsub("s", NA, eth$Total.Grads.Num)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Total.Grads.Num <- repS

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, eth$Still.Enrolled.Num)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Still.Enrolled.Num <- repS

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, eth$Still.Enrolled.Pct.of.cohort)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Still.Enrolled.Pct.of.cohort <- repS

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, eth$Dropped.Out.Num)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Dropped.Out.Num <- repS

#remove '%' from percent values in Total.Grads.Pct.of.cohort
repS <- gsub("s", NA, eth$Dropped.Out.Pct.of.cohort)
repS <- gsub("%", "", repS)
repS <- as.numeric(repS)

eth$Dropped.Out.Pct.of.cohort <- repS

# chunkbyYearMonth <- function(data, year, month, category){
#   # takes data.frame data, number year, and string year
#   # subset by year
#   datasub1 <- subset(data, (data$Cohort.Year == year))
#   # use grep to search for whatever month I give it; subset by month
#   datasub2 <- datasub1[grep(paste0("*", month),
#                             datasub1$Cohort.Category),]
#   # check if category is "*", else, append "*"
#   if(category == "*"){
#     catstring = category
#   } else{
#     catstring = paste0("^", category)
#   }
#   datasub3 <- datasub2[grep(catstring, 
#                             datasub2$Cohort.Category),]
#   row.names(datasub3) <- NULL
#   return(datasub3)
# }

eth.2004 = chunkbyYearMonth(data = data, year = '2004', month = 'June', category = '4')
eth.2005 = chunkbyYearMonth(data = data, year = '2005', month = 'June', category = '4')
eth.2006 = chunkbyYearMonth(data = data, year = '2006', month = 'June', category = '4')
eth.2007 = chunkbyYearMonth(data = data, year = '2007', month = 'June', category = '4')



View(eth)