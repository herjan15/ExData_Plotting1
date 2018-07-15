plot4 <- function(dir) {
  
  Sys.setlocale("LC_ALL", "English")
  
  current_dir <- getwd()
  
  setwd(dir)
  
  raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
  raw_data <- raw_data[21000:600000, ]
  
  setwd(current_dir)
  
  
  data_ <- subset(raw_data, strptime(raw_data$Date, format='%d/%m/%Y') %in% 
                    c("2007-02-01", "2007-02-02"))
  
  data_$Date <- paste(data_$Date, data_$Time)
  
  data_$Date <- strptime(data_$Date, format='%d/%m/%Y %H:%M:%S')
  
  data_sub <- subset(data_, !is.na(Sub_metering_1) & 
                       !is.na(Sub_metering_2) & 
                       !is.na(Sub_metering_3))
  
  data_gap <- subset(data_, !is.na(Global_active_power))
  
  data_vol <- subset(data_, !is.na(Voltage))
  
  data_grp <- subset(data_, !is.na(Global_reactive_power))
  
  png(filename = "plot4.png", width = 480, height = 480)
  
  par(mfrow=c(2,2))
  
  plot(data_gap$Date, data_gap$Global_active_power, type='l',
       xlab="", ylab="Global Active Power (kilowatts)")
  
  plot(data_vol$Date, data_vol$Voltage, type='l',
       xlab="daytime", ylab="Voltage")
  
  plot(data_sub$Date, data_sub$Sub_metering_1, type='l',
       xlab="", ylab="Energy sub metering", col="black")
  
  points(data_sub$Date, data_sub$Sub_metering_2, type='l', 
         col="red")
  
  points(data_sub$Date, data_sub$Sub_metering_3, type='l', 
         col="blue")
  
  plot(data_grp$Date, data_grp$Global_reactive_power, type='l',
       xlab="daytime", ylab="Global_reactive_power")
  
  dev.off()
  
}