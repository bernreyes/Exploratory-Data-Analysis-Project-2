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

# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

#select Baltimore City
Baltimore  <- NEI[NEI$fips=="24510", ]

#aggregate total PM2.5 emissions of Baltimore City for each year
aggregatedData <- aggregate(Emissions ~ year, Baltimore, sum)

#create file
png('Plot2.png', width=480, height=480)

#create the plot 
barplot(height=aggregatedData$Emissions, 
        names.arg=aggregatedData$year, 
        main=expression('Total PM2.5 emissions per year in Baltimore City, Maryland'),
        xlab="Years", ylab=expression('Total PM2.5 Emission'))

dev.off()
