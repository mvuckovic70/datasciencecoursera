## loading dataset

setwd("D:/Projects/R/coursera/4. Exploratory data analysis/datasets")
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

## converting variables

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

## subsetting data

datasetsub <- subset(dataset, dataset$Date > "2007-01-31" & dataset$Date < "2007-02-03")
datasetsub$Global_active_power <- as.numeric(datasetsub$Global_active_power)

## converting time

datetime <- paste(as.Date(datasetsub$Date), datasetsub$Time)
datasetsub$Datetime <- as.POSIXct(datetime)

## removing primary dataset

rm(dataset)

## Plotting

par(mfrow=c(2,2), mar=c(2,4,2,1), oma=c(2,1,0,2))

with(datasetsub, {
  plot(Global_active_power ~ Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  plot(Voltage ~ Datetime, type="l", 
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1 ~ Datetime, type="l", 
       ylab="Global Active Power", xlab="")
  lines(Sub_metering_2 ~ Datetime,col='Red')
  lines(Sub_metering_3 ~ Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch=1, pt.cex = 1)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power", xlab="datetime")
})

## Saving

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
