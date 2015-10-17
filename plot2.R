setwd("/Users/herve/documents/datascience/r/Exploratory Data Analysis")
p <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
dateTimeString <- paste(p[,1], p[,2]," ")
dateTime <- strptime(dateTimeString, "%d/%m/%Y %H:%M:%S")
power <- cbind(dateTime,p)
colnames(power) <- c("DateTime", "Date", "Time", "Global_active_power", "Global_reactive_power", 
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

png("plot2.png")
#plot(power[,1], power[,4], pch=".", type="l", xlab="", ylab="Global Active Power (kilowatts)") 
with(power, plot(DateTime, Global_active_power, pch=".", type="l", xlab="", ylab="Global Active Power (kilowatts)") )
dev.off()

