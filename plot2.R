#this script is intended to recreate plot 2

RawRead <- read.csv(file = "RawData/household_power_consumption.txt", 
                    sep = ";",
                    header = TRUE,
                    na.strings = "?")

#this particular script will then create a bar graph with red bars, etc. 
#according to the assignment spec. 

#RawRead$Date <- as.Date(RawRead$Date, format = "%d/%m/%Y")

#RawRead$Time <- hms::as.hms(as.character(RawRead$Time))

# RawRead$TimeDate <- lubridate::dmy_hms(
#   paste(
#     RawRead$Date,
#     RawRead$Time)
#   )

RawRead$TimeDate <- strptime(
  paste(
    RawRead$Date,
    RawRead$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

#RawRead$TimeDate2 <- as.POSIXlt(RawRead$TimeDate)

#names(RawRead)

Feb_1_2_PowData <- subset(RawRead,
                          TimeDate >= as.POSIXlt("2007-2-1 00:00:00") 
                          & TimeDate <= as.POSIXlt("2007-2-2 23:59:59")
                          #,
                          # select = c(TimeDate, 
                          #            Global_active_power, 
                          #            Global_reactive_power, 
                          #            Voltage, 
                          #            Global_intensity, 
                          #            Sub_metering_1, 
                          #            Sub_metering_2, 
                          #            Sub_metering_3)
)


##TODO: make line plot of of active Global power through these two days  