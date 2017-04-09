library(data.table)
# Set up data using filtered data from plot1
data_filtered <- fread("household_consumption_filtered.csv",sep = ",",header = T)
# Add DateTime column as combination of Date and Time columns
data_filtered <- within(data_filtered, DateTime <- paste(Date, Time, sep = " "))
data_filtered$DateTime <- as.POSIXct(data_filtered$DateTime,tz = "GMT")

# Plotting week day and GAP in 480x480 png
png("plot2.png", width = 480, height = 480)
with(data_filtered, plot(DateTime, Global_active_power, type = "l",
                xlab="",
                ylab="Global Active Power (kilowatts)"))
dev.off()
