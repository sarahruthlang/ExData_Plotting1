#set working directory
	setwd("C:/Users/sarahruthlang/Documents/R/EDA_Assignment1")

#read in data table
	raw_data <- read.table("household_power_consumption.txt",header=TRUE,
      	sep=';',na.strings='?')
	raw_data<-raw_data[raw_data$Date=='1/2/2007' | raw_data$Date=='2/2/2007',]
	raw_data$Date <- strptime(raw_data$Date, "%d/%m/%Y")
	raw_data$Date <- as.Date(raw_data$Date)

#casting dates
	datetime <- paste(as.Date(raw_data$Date), raw_data$Time)
	raw_data$Datetime <- as.POSIXct(datetime)

#create plot
	par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
	with(raw_data, {

  	plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

  	plot(Voltage~Datetime, type="l", ylab="Voltage (volt)", xlab="Datetime")

  	plot(Sub_metering_1~Datetime, type="l", ylab="Energy sub metering", xlab="")
  	lines(Sub_metering_2~Datetime,col='Red')
  	lines(Sub_metering_3~Datetime,col='Blue')
  	legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  	plot(Global_reactive_power~Datetime, type="l", ylab="Global Reactive Power (kilowatts)",xlab="Datetime")

})

dev.copy(png, file="plot4.png", height=1200, width=1200)
dev.off()