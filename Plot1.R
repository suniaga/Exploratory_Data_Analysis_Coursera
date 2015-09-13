##reading the data
tarea <- read.csv("~/household_power_consumption.txt", header=T, sep=";", na.strings="?", stringsAsFactors=FALSE)
 View(tarea)
## Subsetting the data
tarea$Date=as.Date(tarea$Date, format="%d/%m/%Y")
tarea2=subset(subset=(Date<="2007-02-02") & Date>="2007-01-02"))

tarea2$Date=as.Date(tarea2$Date, format="%d/%m/%Y")
## Converting dates
datetime <- paste(as.Date(tarea2$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)
tarea2$Global_active_power<-as.numeric(tarea2$Global_active_power)
##Plot 1

hist(tarea2$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
