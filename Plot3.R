
##Plot 3

##Set the working directory where the file has been saved
setwd("C:/Users/nascott/Documents/Work/Personal/Self Development/EDA/Week 1")

##Read in the data
mydata<-read.table("household_power_consumption.txt",sep=";",header = TRUE, colClasses = "character")

##Set the libraries I plan to use
library(dplyr)
library(lubridate)


##Subset the data for only dates 2007-02-01 and 2007-02-02
mydata<-mutate(mydata,mydate= as.Date(dmy(mydata$Date)))
mydata.f<- mydata[ which( mydata$mydate == "2007-02-01" | mydata$mydate == "2007-02-02") , ]

##Get the date into a format I can use
mydata.f<-mutate(mydata.f,Global_active_power=as.numeric(Global_active_power),Sub_metering_1=as.numeric(Sub_metering_1),Sub_metering_2=as.numeric(Sub_metering_2),Sub_metering_3=as.numeric(Sub_metering_3),datetime=paste(Date,Time))

##Open the graphic device
png(filename="Plot3.png",width=480, height=480)

##Plot the graph

with(mydata.f, plot(strptime(datetime,"%d/%m/%Y %H:%M:%S"), Sub_metering_1, main = "", type = "n", xlab="", ylab="Sub Metering"))
with(mydata.f, points(strptime(datetime,"%d/%m/%Y %H:%M:%S"), Sub_metering_1, col = "black", type="l"))
with(mydata.f, points(strptime(datetime,"%d/%m/%Y %H:%M:%S"), Sub_metering_2, col = "blue",type="l"))
with(mydata.f, points(strptime(datetime,"%d/%m/%Y %H:%M:%S"), Sub_metering_3, col = "red",type="l"))

legend("topright", pch="-",col = c("black", "blue", "red"), legend = c("Sub Metering 1", "Sub Metering 2","Sub Metering 3"))


##close the graphic device
dev.off()