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
# Plot 3 - Energy sub metering by day
png(file="plot3.png", width=480, height=480)
with(power, plot(dateTime, Sub_metering_1, type="l", col="black", 
                 xlab="", ylab="Energy sub metering"))
with(power, lines(dateTime, Sub_metering_2, type="l", col="red"))
with(power, lines(dateTime, Sub_metering_3, type="l", col="blue"))
legend("topright", pch = "_______", col = c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()