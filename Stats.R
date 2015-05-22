#testing

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
#
?ggplot

#boxplot
boxplot(data$Total.Grads.Pct.of.cohort[data$Demographic == "Female"], 
        data$Total.Grads.Pct.of.cohort[data$Demographic == "Male"], 
        ylab = "Grads as Percent of Cohort", names = c("Female", "Male"), 
        main = "Overall F v M")

boxplot(data.2007$Total.Grads.Pct.of.cohort[data.2007$Demographic == "Female"],
        data.2007$Total.Grads.Pct.of.cohort[data.2007$Demographic == "Female"],
        ylab = "Grads as Percent of Cohort", names = c("Female", "Male"),
        main = "4YJune2007: Pct Grads")

#Overall Comparison
t.test(data$Total.Grads.Pct.of.cohort[data$Demographic == "Female"], 
       data$Total.Grads.Pct.of.cohort[data$Demographic == "Male"])

#Gender Comparison by Year
t.test(data.2004$Total.Grads.Pct.of.cohort[data.2004$Demographic == "Female"], 
       data.2004$Total.Grads.Pct.of.cohort[data.2004$Demographic == "Male"])

t.test(data.2005$Total.Grads.Pct.of.cohort[data.2005$Demographic == "Female"], 
       data.2005$Total.Grads.Pct.of.cohort[data.2005$Demographic == "Male"])

t.test(data.2006$Total.Grads.Pct.of.cohort[data.2006$Demographic == "Female"], 
       data.2006$Total.Grads.Pct.of.cohort[data.2006$Demographic == "Male"])

t.test(data.2007$Total.Grads.Pct.of.cohort[data.2007$Demographic == "Female"], 
       data.2007$Total.Grads.Pct.of.cohort[data.2007$Demographic == "Male"])

# ggplot bar plot
#not working as desired. only plotting one pair of bars. Not sure where the values are coming from.
graph <- ggplot(data.2004, aes(x = factor(Demographic), y = mean(Total.Grads.Pct.of.cohort, na.rm = TRUE), 
                               fill = Demographic, stat = "identity", position = "dodge")) 
t05 <- geom_bar(data = data.2005, aes(x = factor(Demographic), 
                                      y= mean(Total.Grads.Pct.of.cohort, na.rm = TRUE), 
                                      fill = Demographic), 
                stat = "identity", position = "dodge", color = "violet")

t06 <- geom_bar(data = data.2006, aes(x = factor(Demographic), 
                                      y= mean(Total.Grads.Pct.of.cohort, na.rm = TRUE), 
                                      fill = Demographic), 
                stat = "identity", position = "dodge", color = "lightcyan")

graph + t05 + t06


