![Caption](gtarus.png){height=20%}

### The zip file fontains two files:  
* __PM2.5 Emissins Data(summarySCC_PM2.5.rds):__  This file contains data frame with all of the PM2.5 emissions data for 1999,2002,2005,2008. For each year, the table contains number of __tons__ of PM2.5 emitted from a specific type of source for the entire year.

#### __Features__
 * `fips`: A five digit number (represented as string) indicating the U.S county
    + `SCC`: The name of the source as indicated by a digit string.
     + `Pollutant`: A string indicatinfg a pollutant.
    + `Emissions`: Amount of PM2.5 emitted, in tons
    + `type`: The type of source (point, non-point, on-road, or non-road)
    + `year`: the year of emissions recorded
    
 * __Source Classification COde Table(Source_Classification_COde.rds):__ This table provides a mapping from the SCC digit string in the Emissions table to the actual name of the PM2.5 source. The sources are categorized in a few different ways from a more general to more specific and you may  choose to explore whatever categories you think are most useful. For example source "10100101" is known as "Ext Comb /Electric Gen / Anthracite Coal /Pulverized Coal".

You can read in each of the two files using `readRDS()` function.

##### __=================================================================================================__
### __Assignment__
 * The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the U.S over the 10-year period 1999-2008.
 
### __Questions__
___Address each of the following questions in the exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.___  
 1. Have total emissions from PM2.5 decreesde in the United States from 1999 to 2008 using the __base__ plotting system, make a plot showing the total PM2.5 emissions for 1999,2002,2005 and 2008.  
 2. Have total emissions from PM2.5 decreased in the __Baltimore City, Maryland(fips == "24510")__ from 1999 to 2008? Use the __base__ plotting system to make a plot answering this question.  
 3. Of the four types of the sources indicated by the type(point, non-point, on-road, or non-road) variable, which of these four sources have seen decreases in emissions form 1999-2008 for __Baltimore City?__ Which have seen emissions form 1999-2008? Use the ) __ggplot2__ plotting system to make a plot answer this question.  
 4. Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?  
 5. How have emissions from motor vehicle sources changed from 1999-2008 in __Baltimore City__?  
 6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in __Los Angles County__. California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?  

#### __Making and Submitting Plots__
For each plot you should:  


 * Construct the plot and save it to a __PNG file__.
 * Create a separate R code file (`plot1.R`,`plot2.R`,etc) that constructs the corresponding plot, i.e. code in `plot1.R` constructs the `plot1.png` plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Only include the code for a single plot (i.e. `plot1.R` should only include code for producing `plot1.png`)
 * Upload the `PNG` file on the Assignment submission page
 * Copy and paste the R code for the corresponding R file into the text box at the appropriate point in the peer assessment.