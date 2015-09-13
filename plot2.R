##rm(list = ls())
##setwd("/Users/soniasingh/Desktop/Coursera/Data Science Specialization")

##Read all data
data_all <- read.csv("/Users/soniasingh/Desktop/Coursera/Data Science Specialization/household_power_consumption 2.txt", header=T, sep=';', na.strings="?", 
                     nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_all$Date <- as.Date(data_all$Date, format="%d/%m/%Y")

## Subset data
newdata <- subset(data_all, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_all)

## Convert date & time
datetime <- paste(as.Date(newdata$Date), newdata$Time)
newdata$Datetime <- as.POSIXct(datetime)

##Create Plot-2
plot(newdata$Global_active_power~newdata$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Create .png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()


