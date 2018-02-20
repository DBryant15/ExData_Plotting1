#this script is intended to recreate plot 1

#this is just the initial file for structuring. 

#Initial step will be to call in the power consumption data

#Next this will be subsetted. The subsetting will exclude 
#everything outside of the dates 2007-02-01 and 2007-02-02
#or first and second days of Feb. 2007

#this will be pushed to the other scripts. 


library(lubridate)
library(sqldf)

RawRead <- read.csv(file = "RawData/household_power_consumption.txt", 
         sep = ";",
         header = TRUE,
         na.strings = "?")

#this particular script will then create a bar graph with red bars, etc. 
#according to the assignment spec. 

#RawRead$Date <- as.Date(RawRead$Date, format = "%d/%m/%Y")

#RawRead$Time <- hms::as.hms(as.character(RawRead$Time))

RawRead$TimeDate <- lubridate::dmy_hms(paste(RawRead$Date, RawRead$Time))

#names(RawRead)

Feb_1_2_PowData <- subset(RawRead,
                          TimeDate >= "2007-2-1 00:00:01" & TimeDate <= "2007-2-2 23:59:59",
                          select = c(TimeDate, 
                                     Global_active_power, 
                                     Global_reactive_power, 
                                     Voltage, 
                                     Global_intensity, 
                                     Sub_metering_1, 
                                     Sub_metering_2, 
                                     Sub_metering_3)
                          )

hist(Feb_1_2_PowData$Global_active_power)
