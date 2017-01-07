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

# Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources
# in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


#select Baltimore City
BaltimoreLosAngelesVehicle  <- subset(NEI, (fips == "24510" | fips == "06037") & type=="ON-ROAD")

#aggregate total PM2.5 emissions of motor vehicle sources from Batimore and Los Angeles for each year
aggregatedData <- aggregate(Emissions ~ year + fips, BaltimoreLosAngelesVehicle, sum)

aggregatedData$city <- rep(NA, nrow(aggregatedData))
aggregatedData[aggregatedData$fips == "06037", ][, "city"] <- "Los Angeles County"
aggregatedData[aggregatedData$fips == "24510", ][, "city"] <- "Baltimore City"

library(ggplot2)

#create file
png('Plot6.png', width=700, height=480)

#create the plot 
a <- ggplot(aggregatedData, aes(x=year, y=Emissions, colour=city)) 
a <- a + geom_line() +
    xlab("Years") + ylab(expression('Total PM2.5 Emission')) +
    ggtitle('Total PM2.5 emissions per year from motor vehicle resources in Baltimore City vs Los Angeles')
print(a)

dev.off()