##Plot2
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
## Make line plot
plot(data_2_days$Global_active_power~data_2_days$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "") 
## Make png from diagram
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()