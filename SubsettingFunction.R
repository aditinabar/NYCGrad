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


