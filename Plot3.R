#Bern Reyes - Exploratory Data Analysis Project 2

setwd("C:/Users/Peesonal/Documents/Dette/Coursera/4. Exploratory Data Analysis/Week 4/Project")

# get the data
## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}

# Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable,
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
# Which have seen increases in emissions from 1999-2008?
# Use the ggplot2 plotting system to make a plot answer this question.


#select Baltimore City
Baltimore  <- NEI[NEI$fips=="24510", ]

#aggregate total PM2.5 emissions of Baltimore City for each year
aggregatedData <- aggregate(Emissions ~ year + type, Baltimore, sum)

library(ggplot2)

#create file
png('Plot3.png', width=600, height=480)

#create the plot 
a <- ggplot(aggregatedData, aes(x=year, y=Emissions, colour=type)) 
a <- a + geom_line() +
    xlab("Years") + ylab(expression('Total PM2.5 Emission')) +
    ggtitle('Total PM2.5 emissions per year and type of sources in Baltimore City, Maryland')
print(a)

dev.off()