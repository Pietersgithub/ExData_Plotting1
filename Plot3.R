##Plot3
## Load data frame into variable
full_data_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", dec=".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
full_data_set$Date <- as.Date(full_data_set$Date, format="%d/%m/%Y")
## Make a subset
data_2_days <- full_data_set[(full_data_set$Date == "2007-2-1" | full_data_set$Date == "2007-2-2"), ]
## Remove total data set from memory
rm(full_data_set)
## Converts dates
date_time <- paste(as.Date(data_2_days$Date), data_2_days$Time)
data_2_days$Datetime <- as.POSIXct(date_time)
## Make plot
plot(data_2_days$Sub_metering_1~data_2_days$Datetime, type="l", col="black", xlab="", ylab="Energy sub metering") 
lines(data_2_days$Sub_metering_2~data_2_days$Datetime, col="red") 
lines(data_2_days$Sub_metering_3~data_2_days$Datetime, col="blue") 
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1) 
## Saves data to file 
dev.copy(png, file = "plot3.png", height = 480, width = 480) 
dev.off() 
