
  
Sys.setlocale("LC_ALL", "English")
  
raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
raw_data <- raw_data[21000:600000, ]
  
  
data_ <- subset(raw_data, strptime(Date, format='%d/%m/%Y') %in% 
                    c("2007-02-01", "2007-02-02"))
  
data_$Date <- paste(data_$Date, data_$Time)
  
data_$Date <- strptime(data_$Date, format='%d/%m/%Y %H:%M:%S')
  
png(filename = "plot2.png", width = 480, height = 480)
  
plot(data_$Date, data_$Global_active_power, type='l',
      xlab="", ylab="Global Active Power (kilowatts)")
  
dev.off()