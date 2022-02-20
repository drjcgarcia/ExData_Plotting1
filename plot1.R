#Exploratory Data Analysis - Project 1: Plot 1.R


# Get file and download to file consumption.zip

data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "./consumption.zip"
download.file(data,dest)

#Unzip file, read and assign table

unzip("consumption.zip")
powerdata <- read.table("household_power_consumption.txt", header = TRUE,sep = ";")

#Subset data of dates: 2007-02-01 and 2007-02-02
subpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

# Construct Plot 1: Global Active Power Histogram

png("plot1.png", width=480, height=480)
hist(as.numeric(subpower$Global_active_power),col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()




