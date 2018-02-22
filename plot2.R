#this script is intended to recreate plot 2

#read in data and filter
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
     Feb_1_2_PowData$Global_active_power, 
     type = "n", 
     ylab = "Global Active Power (kilowatts)", 
     xlab = " ")
lines(Feb_1_2_PowData$TimeDate, Feb_1_2_PowData$Global_active_power)

#plot this
dev.copy(png, file = "plot2.png", width = 480, height = 480)

dev.off()