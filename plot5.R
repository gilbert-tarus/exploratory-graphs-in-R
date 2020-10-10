### Question:
## 5. How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City? 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Subset the required data emissions from motor vehicle sources
motorSources <- subset(NEI,type == "ON-ROAD" & fips == "24510")
## Load the required package
library(ggplot2)
library(dplyr)
## Total Emissions
motorEmissions <- summarise(group_by(motorSources,year),Emissions = sum(Emissions))
motorEmissions <- transform(motorEmissions,year = as.factor(year))

### The barplot for Baltimore City
ggplot(motorEmissions,aes(x = year,y = Emissions, fill = year, label = round(Emissions,2)))+
        geom_bar(stat = "identity")+
        xlab("Year")+
        ylab(expression("Total Emissions (in tons)"))+
        labs(title = expression("Emissions from motor vehicle-Related Sources in Baltimore City"),subtitle = "from 1999-2008",
             caption = paste("Plot 5.","Data Source: EPA National Emissions Inventory web site.","Plot by Gilbert T. Tarus", sep = "\n"))+
        geom_label(color = "black",label.size = 0.1, label.padding = unit(0.1,"lines"))
### Saving the plot to a png file
dev.copy(png, file = "plot5.png") ## Copy the plot to a PNG file
dev.off()
