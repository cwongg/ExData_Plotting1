# Read Data

alldata<-read.csv2("R/Exploratory/household_power_consumption.txt", na.strings="?", stringsAsFactors=FALSE)
data <- subset(alldata, Date=="2/2/2007" | Date =="1/2/2007")

# Data conversions from character

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_intensity <- as.numeric(data$Global_intensity)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
#data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Date <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

# Open Device

png("R/Exploratory/plot2.png", width=480, height=480)

# Plot 2

with(data, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# Close Device

dev.off()