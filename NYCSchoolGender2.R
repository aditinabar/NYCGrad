NYC = read.csv("Grad_by_SchoolGender.csv", header = TRUE)

print(head(NYC))
print(tail(NYC))

# This will rename 5 year August and June to 5 year, not a perfect solution
NYC$Cohort.Category[NYC$Cohort.Category %in% c("5 Year August", "5 Year  June")] <- "5 Year"

# This will fix the problem of having the '%' symbol in the Total Grads Pct of cohort variable
NYC$Total.Grads.Pct.of.cohort <- as.character(NYC$Total.Grads.Pct.of.cohort)
NYC$Total.Grads.Pct.of.cohort <- as.numeric(unlist(sapply(NYC$Total.Grads.Pct.of.cohort, strsplit, "%")))

count <- nrow(year2001) + nrow(year2002) + nrow(year2003) + nrow(year2004) + nrow(year2005) + nrow(year2006) + nrow(year2007)

print(paste(count, "rows remaining"))


# A basic ggplot viz
p <- ggplot(data=NYC, aes(x=factor(Cohort.Year), y=Total.Grads.Pct.of.cohort))
print(p + geom_boxplot(aes(fill=Demographic)) + facet_grid(. ~ Cohort.Category))