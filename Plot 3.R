rm(list=ls())

dt <- read.table('household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors = F, dec=".")
plotdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
plotdt$datetime <- as.POSIXct(paste(plotdt$Date, plotdt$Time), format="%d/%m/%Y %H:%M:%S")
plotdt$Sub_metering_1 <- as.numeric(plotdt$Sub_metering_1)
plotdt$Sub_metering_2 <- as.numeric(plotdt$Sub_metering_2)
plotdt$Sub_metering_3 <- as.numeric(plotdt$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(plotdt$datetime, plotdt$Sub_metering_1 , type="l", xlab="", ylab="Energy Submetering")
lines(plotdt$datetime, plotdt$Sub_metering_2, type="l", col="red")
lines(plotdt$datetime, plotdt$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
