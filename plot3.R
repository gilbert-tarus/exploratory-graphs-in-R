### Question:
## 3. Of the four types of the sources indicated by the type(point, non-point, on-road, or non-road) 
## variable, which of these four sources have seen decreases in emissions form 1999-2008 for 
## Baltimore City? Which have seen emissions form 1999-2008? Use the ) ggplot2 plotting system 
## to make a plot answer this question. 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Subset the required data(Baltimore City, Maryland(fips == "24510"))
wdata3 <- subset(NEI,fips == "24510")
## Load the required package
library(ggplot2)
library(dplyr)
## Total Emissions
totalEmissions3 <- summarise(group_by(wdata3,year,type),totals3 = sum(Emissions))
totalEmissions3 <- transform(totalEmissions3,year = as.factor(year))

ggplot(totalEmissions3,aes(x = year,y = totals3, fill = type, label = round(totals3,2)))+
        geom_bar(stat = "identity",position = "dodge")+
        facet_grid(.~type )+
        theme_dark()+
        xlab("Year")+
        ylab(expression("Total PM"[2.5]*" Emissions"))+
        labs(title = expression("PM"[2.5]*" Emissions for Baltimore City"),subtitle = "By Various Source types",
             caption = paste("Plot 3.","Data Source: EPA National Emissions Inventory web site.","Plot by Gilbert T. Tarus", sep = "\n"))+
        geom_label(color = "black",label.size = 0.1, label.padding = unit(0.1,"lines"),cex = 2.5)
### Saving the plot to a png file
dev.copy(png, file = "plot3.png") ## Copy the plot to a PNG file
dev.off()
