#this script is intended to recreate plot 3

#get and filter data
RawRead <- read.csv(file = "RawData/household_power_consumption.txt", 
                    sep = ";",
                    header = TRUE,
                    na.strings = "?")

RawRead$TimeDate <- strptime(
  paste(
    RawRead$Date,
    RawRead$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

Feb_1_2_PowData <- subset(RawRead,
                          TimeDate >= as.POSIXlt("2007-2-1 00:00:00") 
                          & TimeDate <= as.POSIXlt("2007-2-2 23:59:59")
)

#create plot
plot(Feb_1_2_PowData$TimeDate, 
     Feb_1_2_PowData$Sub_metering_1, 
     type = "n", 
     ylab = "Energy sub metering", 
     xlab = " ")
lines(Feb_1_2_PowData$TimeDate, Feb_1_2_PowData$Sub_metering_1, col = "black")
lines(Feb_1_2_PowData$TimeDate, Feb_1_2_PowData$Sub_metering_2, col = "red")
lines(Feb_1_2_PowData$TimeDate, Feb_1_2_PowData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", 
                     "Sub_metering_2", 
                     "Sub_metering_3"),
       lty=c(1,1), 
       lwd=c(2.5,2.5), 
       col=c("black","red","blue"))

#push plot to file
dev.copy(png, file = "plot3.png", width = 480, height = 480)

dev.off()
