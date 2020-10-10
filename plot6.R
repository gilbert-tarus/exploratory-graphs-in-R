### Question:
## 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
## sources in Los Angles County. California (fips == "06037"). Which city has seen greater 
## changes over time in motor vehicle emissions?  
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Subset the required data(Baltimore City, Maryland(fips == "24510") and Los Angles County. California (fips == "06037"))
## Load the required package
library(ggplot2)
library(dplyr)
compareMotorSources <- subset(NEI,type == 'ON-ROAD' & fips %in%c("06037","24510"))
compareMotorSources <- transform(compareMotorSources, year = as.factor(year))
compareMotorSources$city <- ifelse(compareMotorSources$fips == "06037","Los Angles","Baltimore")
compare <- summarise(group_by(compareMotorSources,year,city),Emissions = sum(Emissions))
## The barplot
ggplot(compare,aes(x = city, y = Emissions, fill = year,label = round(Emissions,2)))+
        geom_bar(stat = "identity",position = "dodge")+
        facet_grid(.~year)+
        theme_dark()+
        xlab("Cities")+
        ylab(expression("Total PM"[2.5]*" Emissions (tons)"))+
        labs(title = expression("PM"[2.5]*" Emissions from Motor Vehicle Sources in Baltimore City Vs. Los Angles County"),
             subtitle = "from 1999-2008",
             caption = paste("Plot 6.","Data Source: EPA National Emissions Inventory web site.","Plot by Gilbert T. Tarus", sep = "\n"))+
        geom_label(col = "black",label.padding = unit(0.1,"lines"),cex = 2.5)
        


### Saving the plot to a png file
dev.copy(png, file = "plot6.png") ## Copy the plot to a PNG file
dev.off()
