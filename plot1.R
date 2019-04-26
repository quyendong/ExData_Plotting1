## Quyen Dong
## 25 APR 2019
## CRSE4_WK1_PROG_ASGNMT

## Set path to directory
setwd("C:/Users/RDITLQTD/Desktop/Data_Science_Specialization/CRSE4_ExploratoryDataAnalysis/CRSE4_WK1_PROG_ASGNMT")

## Read in data
data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";")
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

# Make plot 1
allData$Global_active_power <- as.character(allData$Global_active_power)
allData$Global_active_power <- as.numeric(allData$Global_active_power)
hist(allData$Global_active_power, 
     main = "Global Active Power", 
     col = "red",
     xlab = "Global Active Power (kilowatts)",
     ylab = "February",
     include.lowest = TRUE)

dev.copy(png, file = "plot1.png")
dev.off()