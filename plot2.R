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
	plot(raw_data$Datetime, raw_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
	dev.copy(png, file="plot2.png", height=480, width=480)
	dev.off()