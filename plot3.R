##reading the data
tarea <- read.csv("~/household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=FALSE)
 View(tarea)
## Subsetting the data
tarea$Date=as.Date(tarea$Date, format="%d/%m/%Y")
tarea2=subset(tarea, subset=Date<="2007-02-02" & Date>="2007-01-02")
rm(tarea)
tarea2$Date=as.Date(tarea2$Date, format="%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(tarea2$Date), tarea2$Time)
tarea2$Datetime <- as.POSIXct(datetime)
tarea2$Global_active_power<-as.numeric(tarea2$Global_active_power)

## Plot 3
with(tarea2, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

