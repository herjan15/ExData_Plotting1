plot1 <- function(dir) {
  
  current_dir <- getwd()
  setwd(dir)
  
  raw_data <- read.table('household_power_consumption.txt', 
                         sep=";", header=T, na.strings="?")
  
  raw_data <- raw_data[21000:600000, ]
  
  setwd(current_dir)
  
  data_ <- subset(raw_data, !is.na(raw_data$Global_active_power))
  
  data_ <- subset(data_, strptime(data_$Date, format='%d/%m/%Y') %in% 
                    c("2007-02-01", "2007-02-02")) 
  
  png(filename = "plot1.png", width = 480, height = 480)
  
  hist(data_$Global_active_power, col="red", freq=T, 
       xlab="Global Active Power (kilowatts)", 
       ylab="Frequency", main="Global Active Power", 
       breaks=12, ylim=c(0, 1200))
  
  
  dev.off()
  
}