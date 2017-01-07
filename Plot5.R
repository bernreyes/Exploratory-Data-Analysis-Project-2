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

# Question 5
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#select Baltimore City
BaltimoreVehicle  <- subset(NEI, fips == "24510" & type=="ON-ROAD")

#aggregate total PM2.5 emissions of motor vehicle sources from Batimore for each year
aggregatedData <- aggregate(Emissions ~ year, BaltimoreVehicle, sum)


library(ggplot2)

#create file
png('Plot5.png', width=550, height=480)

#create the plot 
a <- ggplot(aggregatedData, aes(factor(year), Emissions)) 
a <- a + geom_bar(stat="identity") +
    xlab("Years") + ylab(expression('Total PM2.5 Emission')) +
    ggtitle('Total PM2.5 emissions per year from motor vehicle resources in Baltimore City')
print(a)

dev.off()