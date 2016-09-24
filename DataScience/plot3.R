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

## plotting

with(data, {
  plot(Sub_metering_1 ~ Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2 ~ Datetime,col='Red')
  lines(Sub_metering_3 ~ Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## saving

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
