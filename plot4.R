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

##Create plot-4
par(mfrow=c(2,2), mar=c(5,5,2,1), oma=c(0,0,0,2)) #used par to query graphical parameters
with(newdata, {
        {plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power", xlab="")
        
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage", xlab="datetime")
        
        plot(Sub_metering_1~Datetime, type="l", # l is for line plot
             ylab="Energy sub-metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        }
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",#supress legend box
               legend=c("Submetering1", "Submetering2", "Submetering3"))
         #extra curly brackets make output neater
        {plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global_reactive_power",xlab="datetime")
        }
})

## Create .png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()