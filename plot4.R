#Exploratory Data Analysis - Project 1: Plot 4.R


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

#Set png file

png("plot4.png", width = 480, height = 480)

#Establish multi-graph plot dimensions

par(mfrow=c(2,2))

# List plots:

  #Plot 1: Global Active Power
  plot(subpower$Time,as.numeric(as.character(subpower$Global_active_power)),
     type="l",xlab="",ylab="Global Active Power") 
  
  #Plot 2: Voltage per Day
  plot(subpower$Time,as.numeric(as.character(subpower$Voltage)),
       type="l",xlab="datetime",ylab="Voltage")
  
  #Plot 3: Energy Sub-metering
  plot(subpower$Time,subpower$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
    with(subpower,lines(Time,as.numeric(as.character(Sub_metering_1))))
    with(subpower,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
    with(subpower,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
    legend("topright", lty=1, col=c("black","red","blue"),
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
    
  #Plot 4: Global Reactive Power per Day
    plot(subpower$Time,as.numeric(as.character(subpower$Global_reactive_power)),
         type="l",xlab="",ylab="Global_reactive_power")

#Close png graphing device
dev.off()


