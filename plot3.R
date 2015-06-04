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
with(raw_data, {
  plot(Sub_metering_1~Datetime,  type="l", xlab="", ylab="Energy sub metering")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 
})

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()