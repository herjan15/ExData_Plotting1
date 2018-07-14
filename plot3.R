plot3 <- function(dir) {
  
  Sys.setlocale("LC_ALL", "English")
  
  current_dir <- getwd()
  
  setwd(dir)
  
  raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
  setwd(current_dir)
  
  data_ <- subset(raw_data, !is.na(Sub_metering_1) & 
                  !is.na(Sub_metering_2) & 
                    !is.na(Sub_metering_3))
  
  data_ <- subset(data_, strptime(data_$Date, format='%d/%m/%Y') %in% 
                             c("2007-02-01", "2007-02-02"))
  
  data_$Date <- paste(data_$Date, data_$Time)
  
  data_ <- data_[, c("Date", "Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3")]
  
  data_$Date <- strptime(data_$Date, format='%d/%m/%Y %H:%M:%S')
  
  png(filename = "plot3.png", width = 480, height = 480)
  
  plot(data_$Date, data_$Sub_metering_1, type='l',
       xlab="", ylab="Energy sub metering", col="black")
  
  points(data_$Date, data_$Sub_metering_2, type='l', col="red")
  
  points(data_$Date, data_$Sub_metering_3, type='l', col="blue")
  
  legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
         col=c("black", "red", "blue"), lty=c(1,1,1), lwd=2)
  
  dev.off()
  
}