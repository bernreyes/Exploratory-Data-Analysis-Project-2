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

# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

# get sources indicating coal combustion
coal <- SCC[grepl("[Cc]oal", SCC$Short.Name),]

# get subset of NEI data that is included in coal-related sources
coaldata <- subset(NEI, NEI$SCC %in% coal$SCC)


#aggregate total PM2.5 emissions of coal combustion-related sources for each year
aggregatedData <- aggregate(Emissions ~ year, coaldata, sum)


library(ggplot2)

#create file
png('Plot4.png', width=480, height=480)

#create the plot 
a <- ggplot(aggregatedData, aes(factor(year), Emissions)) 
a <- a + geom_bar(stat="identity") +
    xlab("Years") + ylab(expression('Total PM2.5 Emission')) +
    ggtitle('Total PM2.5 emissions per year from coal combustion-related sources')
print(a)

dev.off()