setwd("/Users/naditi/PycharmProjects/NYCGrad")
getwd()

NYC = read.csv("Grad_by_SchoolGender.csv", header = TRUE)

head(NYC)
tail(NYC)

#subsetting: sort by Cohort Year
year2001 = subset(NYC,  grepl("2001", NYC$Cohort.Year))
year2002 = subset(NYC,  grepl("2002", NYC$Cohort.Year))
year2003 = subset(NYC,  grepl("2003", NYC$Cohort.Year))
year2004 = subset(NYC,  grepl("2004", NYC$Cohort.Year))
year2005 = subset(NYC,  grepl("2005", NYC$Cohort.Year))
year2006 = subset(NYC,  grepl("2006", NYC$Cohort.Year))
year2007 = subset(NYC,  grepl("2007", NYC$Cohort.Year))
 
#subsetting: remove August grad rates
#both 2005 lines produce a df with same number of obs. 
year2005June <- subset(year2005, Cohort.Category!="4 Year August")
year2005June <- year2005[which(year2005$Cohort.Category != "4 Year August" & year2005$Cohort.Category != "5 Year August"),]
year2006June <- year2006[which(year2006$Cohort.Category != "4 Year August" & year2006$Cohort.Category != "5 Year August"),]
year2007June <- year2007[which(year2007$Cohort.Category != "4 Year August" & year2007$Cohort.Category != "5 Year August"),]

count <- nrow(year2001) + nrow(year2002) + nrow(year2003) + nrow(year2004) + nrow(year2005) + nrow(year2006) + nrow(year2007)
count