#this script is intended to recreate plot 1
# read in and filter data
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

#make the histogram
hist(Feb_1_2_PowData$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = "red")


#make png and close
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
