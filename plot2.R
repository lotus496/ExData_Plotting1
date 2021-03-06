hpc <- read.delim("household_power_consumption.txt", sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc <- subset(hpc, (Date == "1/2/2007") | (Date == "2/2/2007"))
hpc <- transform(hpc, datetime = strptime(paste(Date,Time), format = "%d/%m/20%y %H:%M:%S"))
hpc <- transform(hpc, Date = as.Date(Date, format = "%d/%m/20%y"))
png(filename = "plot2.png")
par(bg = "transparent")
with(hpc, plot(datetime,Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", pch = ""))
lines(hpc$datetime,hpc$Global_active_power)
dev.off()