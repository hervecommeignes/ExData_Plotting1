setwd("/Users/herve/documents/datascience/r/Exploratory Data Analysis")
p <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
dateTimeString <- paste(p[,1], p[,2]," ")
dateTime <- strptime(dateTimeString, "%d/%m/%Y %H:%M:%S")
power <- cbind(dateTime,p)
colnames(power) <- c("DateTime", "Date", "Time", "Global_active_power", "Global_reactive_power", 
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

png("plot4.png")
par(mfrow = c(2,2), mar=c(4,5,1,1), oma=c(0,0,0,0))
plot(power[,1], power[,4], pch=".", type="l", xlab="", ylab="Global Active Power") 
plot(power[,1], power[,"Voltage"], pch=".", type="l", xlab="", ylab="Voltage") 

plot(power[,1], power[,8], type="l", xlab="", ylab="Energy sub metering") 
lines(power[,1], power[,9], col="red")
lines(power[,1], power[,10], col="blue")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(power[,1], power[,5], pch=".", type="l", xlab="", ylab="Global_reactive_power") 
dev.off()

