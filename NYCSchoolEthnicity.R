setwd("/Users/naditi/PycharmProjects/NYCGrad")

eth <- read.table("Graduation_Outcomes_by_SchoolLevel_Ethnicity_2005-2011.csv", sep = ",", 
                  header = TRUE, stringsAsFactor = TRUE)
row.names(eth) <- NULL
eth[,1] <- NULL

for(i in 8:16){
  data[,i] <- NULL
}

View(eth)