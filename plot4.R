#HEADER

##assign filepath
datacon <- "household_power_consumption.txt"

##Read connection
data <- read.table(datacon, header=TRUE, sep=";", na.strings = "?")      ###READ.TABLE

##Set date format (1-2/2/2007)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##SUBSET Feb 1 and 2
Feb1and2 <- subset(data, Date>= "2007-02-01" & Date<="2007-02-02")

#PLOT
##Convert dates to posixct
datetime <- paste(as.Date(Feb1and2$Date), Feb1and2$Time)
Feb1and2$datetime <- as.POSIXct(datetime)

##Set Values
volt12 <- Feb1and2$Voltage
SM1 <- Feb1and2$Sub_metering_1
SM2 <- Feb1and2$Sub_metering_2
SM3 <- Feb1and2$Sub_metering_3
GAP12 <- Feb1and2$Global_active_power
GRP12 <- Feb1and2$Global_reactive_power

##Printing

par(mfrow = c(2, 2))
with(Feb1and2, {
  plot(GAP12~Feb1and2$datetime,type="l", 
             ylab="Global Active Power", xlab="")
  plot(volt12~Feb1and2$datetime, type="l", xlab="datetime", ylab="Voltage")
  plot(SM1~Feb1and2$datetime, type="l", xlab="", ylab="Enegry sub metering")
    lines(SM2~Feb1and2$datetime, col="red")
    lines(SM3~Feb1and2$datetime, col="blue")
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col = c("black","red","blue"))
  plot(GRP12~Feb1and2$datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
})
  
#Dev.copy
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()