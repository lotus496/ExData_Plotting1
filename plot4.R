hpc <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc <- subset(hpc, (Date == "1/2/2007") | (Date == "2/2/2007"))
hpc <- transform(hpc, datetime = strptime(paste(Date,Time), format = "%d/%m/20%y %H:%M:%S"))
hpc <- transform(hpc, Date = as.Date(Date, format = "%d/%m/20%y"))

png(filename = "plot4.png")
par(mfrow = c(2,2), bg = "transparent")
with(hpc, plot(datetime,Global_active_power, xlab = "", ylab = "Global Active Power", pch = ""))
lines(hpc$datetime,hpc$Global_active_power)

with(hpc, plot(datetime,Voltage, ylab = "Voltage", pch = ""))
lines(hpc$datetime,hpc$Voltage)

with(hpc, plot(datetime,Sub_metering_1, xlab = "", ylab = "Energy sub metering", pch = ""))
lines(hpc$datetime,hpc$Sub_metering_1, col = "black")
lines(hpc$datetime,hpc$Sub_metering_2, col = "red")
lines(hpc$datetime,hpc$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


with(hpc, plot(datetime,Global_reactive_power, pch = ""))
lines(hpc$datetime,hpc$Global_reactive_power)
dev.off()