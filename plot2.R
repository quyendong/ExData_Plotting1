## Quyen Dong
## 25 APR 2019
## CRSE4_WK1_PROG_ASGNMT

## Set path to directory
setwd("C:/Users/RDITLQTD/Desktop/Data_Science_Specialization/CRSE4_ExploratoryDataAnalysis/CRSE4_WK1_PROG_ASGNMT")

## Read in data
data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt",
                 sep = ";")
head(data)

## install and load lubridate package
if (!require(lubridate)) {
  install.packages("lubridate")
}
Sys.getlocale("LC_TIME")
library(lubridate)

## Grab only dates between 2007-02-01 and 2007-02-02
names(data)
startDate <- ymd("2007-02-01")
endDate <- ymd("2007-02-02")
data$Date <- dmy(data$Date)
startData <- data[data$Date == startDate,]
endData <- data[data$Date == endDate,]
allData <- rbind(startData, endData)

## Add date and time to allData
allData$DateTime <- ymd_hms(paste0(allData$Date," ", allData$Time))

## Make plot 2
allData$Global_active_power <- as.character(allData$Global_active_power)
allData$Global_active_power <- as.numeric(allData$Global_active_power)
y <- allData$Global_active_power
x <- allData$DateTime
plot(allData$DateTime, y, type="l", xlab= "", ylab = "Global Active Power (kilowatts)")

## Make a bitmap (.png) file
dev.copy(png, file = "plot2.png")
dev.off()