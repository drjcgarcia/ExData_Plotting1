#Exploratory Data Analysis - Project 1: Plot 2.R


# Get file and download to file consumption.zip

data <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest <- "./consumption.zip"
download.file(data,dest)

#Unzip file, read and assign table

unzip("consumption.zip")
powerdata <- read.table("household_power_consumption.txt", header = TRUE,sep = ";")

#Subset data of dates: 2007-02-01 and 2007-02-02
subpower <- subset(powerdata,powerdata$Date=="1/2/2007" | powerdata$Date =="2/2/2007")

#Convert Date and Time
subpower$Date <- as.Date(subpower$Date, format="%d/%m/%Y")
subpower$Time <- strptime(subpower$Time, format="%H:%M:%S")
subpower[1:1440,"Time"] <- format(subpower[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpower[1441:2880,"Time"] <- format(subpower[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# Construct Plot 2: Global Active Power by Day

png("plot2.png", width=480, height=480)
plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
