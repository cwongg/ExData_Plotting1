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

png("R/Exploratory/plot4.png", width=480, height=480)

par(mfrow=c(2,2))
par(mar=c(4,4,1,1))

# Plot 4.1 

with(data, plot(Date, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

#Plot 4.2 

with(data, plot(Date, Voltage, type="l", xlab="datetime"))

# Plot 4.3

with(data, plot(Date, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data, points(Date, Sub_metering_1, col="gray", type="l"))
with(data, points(Date, Sub_metering_2, col="red", type="l"))
with(data, points(Date, Sub_metering_3, col="blue", type="l"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("gray", "red", "blue"))

# Plot 4.4

with(data, plot(Date, Global_reactive_power, type="l", xlab="datetime"))

# Close Device

dev.off()
