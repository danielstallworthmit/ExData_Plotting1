library(data.table)
# Set up data
# Read in Data
data <- fread("household_power_consumption.txt",sep = ";",na.strings = "?",header = T)
# Change Date column to date format
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
setkey(data,Date)
# Filter by dates we care about
data <- data[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")]
# Save the filtered data for future analysis
write.csv(data,file = "household_consumption_filtered.csv",row.names = F)

# Plotting the histogram and put graph in 480x480 png
png("plot1.png", width = 480, height = 480)
with(data, hist(Global_active_power, main="Global Active Power",
                xlab="Global Active Power (kilowatts)",
                ylab="Frequency",
                breaks=14,
                col = "red"))
dev.off()