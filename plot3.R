setwd("/Users/herve/documents/datascience/r/Exploratory Data Analysis")
p <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
dateTimeString <- paste(p[,1], p[,2]," ")
dateTime <- strptime(dateTimeString, "%d/%m/%Y %H:%M:%S")
power <- cbind(dateTime,p)
colnames(power) <- c("DateTime", "Date", "Time", "Global_active_power", "Global_reactive_power", 
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

png("plot3.png")
with(power, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering") )
#plot(power[,1], power[,8], type="l", xlab="", ylab="Energy sub metering") 
lines(power$DateTime, power$Sub_metering_2, col="red")
lines(power$DateTime, power$Sub_metering_3, col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

