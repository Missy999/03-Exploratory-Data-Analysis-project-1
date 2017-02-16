rm(list=ls())
library(ggplot2)
dt <- read.table('household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors = F, dec=".")
plotdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
plotdt$datetime <- as.POSIXct(paste(plotdt$Date, plotdt$Time), format="%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(plotdt$datetime, plotdt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
