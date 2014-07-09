# reading course project 1 power data
library(sqldf)
library(tcltk)
power <- read.csv.sql(file="household_power_consumption.txt", 
                      sql="select * from file where Date='1/2/2007' or Date='2/2/2007'", 
                      sep = ";")

# combine date and time columns
power$dateTime <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
str(power) # with 10 variables and 2880 observations

# checked data fields are in correct format
# Plot 4 - Four plots
png(file="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
with(power, {
        plot(dateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(dateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(dateTime, Sub_metering_1, type="l", col="black", 
                 xlab="", ylab="Energy sub metering")
        lines(dateTime, Sub_metering_2, type="l", col="red")
        lines(dateTime, Sub_metering_3, type="l", col="blue")
                legend("topright", pch = "_______", col = c("black","red","blue"), 
                         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
        plot(dateTime, Global_reactive_power, type="l", xlab="datetime", 
                 ylab="Global_reactive_power")
})
dev.off()