### Question:
## 2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland(fips == "24510") 
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
### Subset the required data(Baltimore City, Maryland(fips == "24510"))
wdata <- subset(NEI,fips == "24510")
## Total Emissions
totalEmissions2 <- tapply(wdata$Emissions,wdata$year,sum)
total2 <- data.frame(year = names(totalEmissions2),totals2 = totalEmissions2)
## Barplot
par(bg = "wheat")
bplot2 <- barplot(total2$totals2,names.arg = total2$year, axis.lty = 1, col = total2$year,xlab = "Year",
                 ylab = expression("Total Emissions of PM "[2.5]*" (tons)"),
                 main =expression("Total Emissiosn of PM"[2.5]*" Over 10 Years period in Baltimore City, Maryland" ),
                 ylim = c(0.0,3500),sub = "Plot 2."
)
### Adding text 
text(x=bplot2,y = total2$totals2, labels = round(total2$totals2,2),pos = 3,cex = 1.5,col = "magenta")

### Saving the plot to a png file
dev.copy(png, file = "plot2.png") ## Copy the plot to a PNG file
dev.off()
