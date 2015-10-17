# read.table: using skip and nrows to load exact data
# calculate values for skip & rows, knowing 1 row / minute or 1440 rows per day.
# first, find end of day

setwd("/Users/herve/documents/datascience/r/Exploratory Data Analysis")
397 + 46*1440
power_cons <- read.table("household_power_consumption.txt", sep=";", skip=66637, nrows=2880)
#head(power_cons)
#tail(power_cons)

colnames(power_cons) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
        "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

p <- power_cons
        
#dt <- paste(p[10,1], p[10,2]," ")
#as.Date(dt, "%d/%m/%y")

#strptime("1 2 2012", "%d %m %Y")
#dt2 <- strptime(dt, "%d/%m/%Y %H:%M:%S")
#dt2

dateTimeString <- paste(p[,1], p[,2]," ")
dateTime <- strptime(dateTimeString, "%d/%m/%Y %H:%M:%S")
#dateTime

power <- cbind(dateTime,p)
colnames(power) <- c("DateTime", "Date", "Time", "Global_active_power", "Global_reactive_power", 
                          "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" )

png("plot1.png")
hist(power$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 
dev.off()

