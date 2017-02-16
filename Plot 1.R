rm(list=ls())
dt <- read.table('household_power_consumption.txt',header=TRUE, sep=";", stringsAsFactors = F, dec=".")
plotdt <- dt[dt$Date %in% c("1/2/2007","2/2/2007") ,]
png("plot1.png", width=480, height=480)
hist(as.numeric(plotdt$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
