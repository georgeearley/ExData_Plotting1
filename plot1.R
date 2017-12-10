#HEADER

##assign filepath
datacon <- "household_power_consumption.txt"

##Read connection
data <- read.table(datacon, header=TRUE, sep=";", na.strings = "?")      ###READ.TABLE

##Set date format (1-2/2/2007)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

##SUBSET Feb 1 and 2
Feb1and2 <- subset(data, Date>= "2007-02-01" & Date<="2007-02-02")

#BODY

##Subset Global Active Power data for those dates
GAP12 <- Feb1and2$Global_active_power

##Set PNG Output dimensions, plot, and close dev.
png("plot1.png", width=480, height=480)
hist(GAP12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()