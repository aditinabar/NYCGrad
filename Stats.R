# Need NYCSchoolGender3.R
# ggplot bar plot
statgraph <- ggplot(little_d, aes(x = factor(Year), 
                                  y = MeanPct)) 
geom <- geom_bar(aes(fill = little_d$Demographic, xlab = "Year", ylab = "Average Graduates (%)"), 
                 stat = "identity",
                 position = "dodge", )
color <- scale_fill_brewer(palette = "Set2")
labs <- labs(list(title = "Average Graduates per Year", x = "Year", y = "Average (%)"))
guides <- guides(fill = guide_legend(title = NULL))
theme <- theme(panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      panel.border = element_blank(),
      panel.background = element_blank())

statgraph + geom + labs + guides + color + theme

# Brewer color palettes https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/colorPaletteCheatsheet.pdf



# dsamp <- diamonds[sample(nrow(diamonds), 1000), ]
# (d <- qplot(carat, price, data = dsamp, colour = clarity))
# 
# # Change scale label
# d + scale_colour_brewer()
# d + scale_colour_brewer("clarity")