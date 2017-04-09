library(data.table)
# Set up data
data <- fread("/Users/danielstallworth/Downloads/household_power_consumption.txt",sep = ";",na.strings = "?",header = T)
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
setkey(data,Date)
data <- data[Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02")]

# 
