#set working directory
	setwd("C:/Users/sarahruthlang/Documents/R/EDA_Assignment1")

#read in data table
	raw_data <- read.table("household_power_consumption.txt",header=TRUE,
      	sep=';',na.strings='?')
	raw_data<-raw_data[raw_data$Date=='1/2/2007' | raw_data$Date=='2/2/2007',]

#create plot
	hist(raw_data$Global_active_power, xlab = "Global Active Power (kilowatts)", col ="red", main = "Global Active Power")
	dev.copy(png, file="plot1.png", height=480, width=480)
	dev.off()	
