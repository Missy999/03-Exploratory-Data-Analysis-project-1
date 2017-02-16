rm(list=ls())

dt <- read.table('household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors = F, dec=".")
plotdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
plotdt$datetime <- as.POSIXct(paste(plotdt$Date, plotdt$Time), format="%d/%m/%Y %H:%M:%S")

plotdt$Sub_metering_1 <- as.numeric(plotdt$Sub_metering_1)
plotdt$Sub_metering_2 <- as.numeric(plotdt$Sub_metering_2)
plotdt$Sub_metering_3 <- as.numeric(plotdt$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(plotdt$datetime, as.numeric(plotdt$Global_active_power), type="l", xlab="", ylab="Global Active Power")

plot(plotdt$datetime, as.numeric(plotdt$Voltage), type="l", xlab="datetime", ylab="Voltage")

plot(plotdt$datetime, plotdt$Sub_metering_1 , type="l", xlab="", ylab="Energy Submetering")
lines(plotdt$datetime, plotdt$Sub_metering_2, type="l", col="red")
lines(plotdt$datetime, plotdt$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(plotdt$datetime, as.numeric(plotdt$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

 