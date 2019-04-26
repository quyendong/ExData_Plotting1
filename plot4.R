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

## Make 2 rows and 2 columns of plots
par(mfrow = c(2,2), mar = c(4,4,2,2))

## Make plot 1 GLOBAL ACTIVE POWER/DATETIME
allData$Global_active_power <- as.character(allData$Global_active_power)
allData$Global_active_power <- as.numeric(allData$Global_active_power)
y <- allData$Global_active_power
x <- allData$DateTime
plot(allData$DateTime, y, type="l", xlab= "", ylab = "Global Active Power (kilowatts)")

## Make plot 2 VOLTAGE/DATETIME
allData$Voltage <- as.character(allData$Voltage)
allData$Voltage <- as.numeric(allData$Voltage)
y <- allData$Voltage
x <- allData$DateTime
plot(allData$DateTime, y, type="l", xlab= "datetime", ylab = "Voltage")

## Make plot 3 ENERGY SUB METERING
allData$Sub_metering_1 <- as.character(allData$Sub_metering_1)
allData$Sub_metering_2 <- as.character(allData$Sub_metering_2)
allData$Sub_metering_3 <- as.character(allData$Sub_metering_3)
allData$Sub_metering_1 <- as.numeric(allData$Sub_metering_1)
allData$Sub_metering_2 <- as.numeric(allData$Sub_metering_2)
allData$Sub_metering_3 <- as.numeric(allData$Sub_metering_3)
x <- allData$DateTime
y <- allData$Sub_metering_1
plot(x, y,
     xlab = "", ylab = "Energy sub metering", 
     type = "l")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), 
       lty = c(1, 1, 1),
       cex = .7,
       bty = "n")
lines(x, allData$Sub_metering_2, col = "red", type = "l")
lines(x, allData$Sub_metering_3, col = "blue", type = "l")


## Make plot 4 GLOBAL REACTIVE POWER/DATETIME
allData$Global_reactive_power <- as.character(allData$Global_reactive_power)
allData$Global_reactive_power <- as.numeric(allData$Global_reactive_power)
y <- allData$Global_reactive_power
x <- allData$DateTime
plot(allData$DateTime, y, 
     type ="l", 
     xlab = "datetime", ylab = "Global_reactive_power",
     ylim = c(0, .5)
     )

##Make a bitmap (.png) file
dev.copy(png, file = "plot4.png")
dev.off()

