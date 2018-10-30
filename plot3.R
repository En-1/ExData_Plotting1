
library(tidyverse)
Power<-read_delim(file = "./data/household_power_consumption.txt", na = "?",delim = ";",col_types = "ctnnnnnnn")
Power<-subset(Power, Date=="1/2/2007"|Date=="2/2/2007") 
Power$Date<-strptime(paste(Power$Date, Power$Time), "%d/%m/%Y %H:%M:%S")
plot(x = Power$Date, y = Power$Sub_metering_1,type = "l",xlab ="", ylab = "Energy sub metering")
lines(x = Power$Date, y = Power$Sub_metering_2, col="red")
lines(x = Power$Date, y = Power$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black" ,"red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()

