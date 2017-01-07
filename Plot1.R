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

# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
# Using the base plotting system, make a plot showing the total PM2.5 emission from all sources 
# for each of the years 1999, 2002, 2005, and 2008.

#aggregate total PM2.5 emissions from all sources for each year
aggregatedData <- aggregate(Emissions ~ year, NEI, sum)

#create file
png('Plot1.png', width=480, height=480)

#create the plot 
barplot(height=aggregatedData$Emissions, 
        names.arg=aggregatedData$year, 
        main=expression('Total PM2.5 emissions per year'),
        xlab="Years", ylab=expression('Total PM2.5 Emission'))

dev.off()

