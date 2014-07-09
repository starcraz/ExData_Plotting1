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
# Plot 1 - Global Active Power
png(file="plot1.png", width=480, height=480)
with(power, hist(Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"))
dev.off()