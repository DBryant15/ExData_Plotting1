#this script is intended to recreate plot 1

#this is just the initial file for structuring. 

#Initial step will be to call in the power consumption data

#Next this will be subsetted. The subsetting will exclude 
#everything outside of the dates 2007-02-01 and 2007-02-02
#or first and second days of Feb. 2007

#this will be pushed to the other scripts. 

library(lubridate)

RawRead <- read.csv(file = "RawData/household_power_consumption.txt", 
         sep = ";",
         header = TRUE,
         na.strings = "?")

#this particular script will then create a bar graph with red bars, etc. 
#according to the assignment spec. 

RawRead$Date <- as.Date(RawRead$Date, format = "%d/%m/%Y")

#20180219 1243 DWB this doesn't work, as it 
#seems to insert todays date before the time. 
RawRead$Time <- hms::as.hms(RawRead$Time)
