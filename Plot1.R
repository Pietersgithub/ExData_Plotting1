##Plot1
## Load data frame into variable
full_data_set <- read.table("household_power_consumption.txt", header = TRUE, sep = ';', na.strings = "?", dec=".", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
## Make a subset 
data_2_days <- full_data_set[(full_data_set$Date == "1/2/2007" | full_data_set$Date == "2/2/2007"), ]
## Remove total data set from memory
rm(full_data_set)
## Make histogram
hist(data_2_days$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
## Make png from histogram
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
