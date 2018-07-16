
Sys.setlocale("LC_ALL", "English")
  
raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
raw_data <- raw_data[21000:600000, ]
  
data_ <- subset(raw_data, strptime(raw_data$Date, format='%d/%m/%Y') %in% 
                    c("2007-02-01", "2007-02-02"))
  
data_$Date <- paste(data_$Date, data_$Time)
  
data_$Date <- strptime(data_$Date, format='%d/%m/%Y %H:%M:%S')
  
png(filename = "plot4.png", width = 480, height = 480)
  
par(mfrow=c(2,2))
  
plot(data_$Date, data_$Global_active_power, type='l',
      xlab="", ylab="Global Active Power (kilowatts)")
  
plot(data_$Date, data_$Voltage, type='l',
      xlab="daytime", ylab="Voltage")
  
plot(data_$Date, data_$Sub_metering_1, type='l',
      xlab="", ylab="Energy sub metering", col="black")
  
points(data_$Date, data_$Sub_metering_2, type='l', 
        col="red")
  
points(data_$Date, data_$Sub_metering_3, type='l', 
        col="blue")

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=c(1,1,1), lwd=2)
  
plot(data_$Date, data_$Global_reactive_power, type='l',
      xlab="daytime", ylab="Global_reactive_power")
  
dev.off()