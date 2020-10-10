### Question:
#4. Across the United States, how have emissions from coal combustion-related sources changed 
## from 1999-2008? 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Subset the required data: coal combustion-related sources
coalSources<- SCC[grep("Coal",SCC$EI.Sector),]
coalData <- subset(NEI,NEI$SCC%in%coalSources$SCC)
## Load the required package
library(ggplot2)
library(dplyr)
## Total Emissions
coalEmissions <- summarise(group_by(coalData,year),Emissions = sum(Emissions))
coalEmissions <- transform(coalEmissions,year = as.factor(year))
### Barplot
ggplot(coalEmissions,aes(x = year,y = Emissions/1000, fill = year, label = round(Emissions/1000,2)))+
        geom_bar(stat = "identity")+
        xlab("Year")+
        ylab(expression("Total Coal Combustion Emissions (in Kilotons)"))+
        labs(title = expression("Emissions from Coal Combustion-Related Sources Across United States"),subtitle = "from 1999-2008",
             caption = paste("Plot 4.","Data Source: EPA National Emissions Inventory web site.","Plot by Gilbert T. Tarus", sep = "\n"))+
        geom_label(color = "black",label.size = 0.1, label.padding = unit(0.1,"lines"))
### Saving the plot to a png file
dev.copy(png, file = "plot4.png") ## Copy the plot to a PNG file
dev.off()
