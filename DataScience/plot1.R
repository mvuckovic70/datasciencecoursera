## loading dataset

setwd("D:/Projects/R/coursera/4. Exploratory data analysis/datasets")
dataset <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

## converting variables

dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

## subsetting data

datasetsub <- subset(dataset, dataset$Date > "2007-01-31" & dataset$Date < "2007-02-03")
datasetsub$Global_active_power <- as.numeric(datasetsub$Global_active_power)

## removing primary datasets

rm(dataset)

## plotting & saving to file

png("plot1.png", width=480, height=480)
hist(datasetsub$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
