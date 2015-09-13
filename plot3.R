rm(list = ls())
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

## Create Plot 3
par(mfrow=c(1,1), mar=c(5,5,2,1), oma=c(0,0,0,2))
with(newdata, {
        plot(Sub_metering_1~Datetime, type="l", # l is for line plot
             xlab="",ylab="Energy sub-metering")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Create .png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()