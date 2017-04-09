library(data.table)
# Set up data using filtered data from plot1
data_filtered <- fread("household_consumption_filtered.csv",sep = ",",header = T)
data_filtered <- within(data_filtered, DateTime <- paste(Date, Time, sep = " "))
data_filtered$DateTime <- as.POSIXct(data_filtered$DateTime,tz = "GMT")

# Plotting week day and Sub metering in 480x480 png
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# Plot1
with(data_filtered, plot(DateTime, Global_active_power, type = "l",
                         xlab="",
                         ylab="Global Active Power (kilowatts)"))
# Plot2
with(data_filtered, plot(DateTime, Voltage, type = "l",
                         xlab="datetime",
                         ylab="Voltage"))

# Plot3
with(data_filtered, plot(DateTime, Sub_metering_3,
                         xlab="", ylim = c(0,38),
                         ylab="Energy sub metering",
                         type="n"))
points(data_filtered$DateTime,data_filtered$Sub_metering_1,type="l")
points(data_filtered$DateTime,data_filtered$Sub_metering_2,type="l",col="red")
points(data_filtered$DateTime,data_filtered$Sub_metering_3,type="l",col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),pch = "-")

# Plot4
with(data_filtered, plot(DateTime, Global_reactive_power, type = "l",
                         xlab="datetime",
                         ylab="Global_reactive_power"))

dev.off()

