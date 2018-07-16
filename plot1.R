
raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
raw_data <- raw_data[21000:600000, ]
  
data_ <- subset(raw_data, strptime(raw_data$Date, format='%d/%m/%Y') %in% 
                    c("2007-02-01", "2007-02-02")) 
  
png(filename = "plot1.png", width = 480, height = 480)
  
hist(data_$Global_active_power, col="red", freq=T, 
      xlab="Global Active Power (kilowatts)", 
      ylab="Frequency", main="Global Active Power", 
      breaks=12, ylim=c(0, 1200))
  
  
dev.off()