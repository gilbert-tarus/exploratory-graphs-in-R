### Question:
## 1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
## using the base plotting system, make a plot showing the total PM2.5 emissions for 1999,2002,2005 and 2008. 
### Read the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Total Emissions
totalEmissions <- tapply(NEI$Emissions,NEI$year,sum)
total <- data.frame(year = names(totalEmissions),totals = totalEmissions)

## Barplot
bplot <- barplot(total$totals/1000,names.arg = total$year, axis.lty = 1, col = total$year,xlab = "Year",
        ylab = expression("Total Emissions of PM "[2.5]*" (kilotons)"),main =expression("Total Emissiosn of PM"[2.5]*" Over 10 Years period ('000)"),
        ylim = c(0,8000),sub = "Plot 1."
        )
### Adding text 
text(x=bplot,y = round(total$totals/1000,2), labels = round(total$totals/1000,2),pos = 3,cex = 1.5,col = "magenta")
### Saving the plot to a png file
dev.copy(png, file = "plot1.png") ## Copy the plot to a PNG file
dev.off()
