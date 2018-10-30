
library(tidyverse)
Power<-read_delim(file = "./data/household_power_consumption.txt", na = "?",delim = ";",col_types = "ctnnnnnnn")
Power<-subset(Power, Date=="1/2/2007"|Date=="2/2/2007") 
Power$Date<-strptime(paste(Power$Date, Power$Time), "%d/%m/%Y %H:%M:%S")
par(mfcol=c(2,2))
plot(x = Power$Date, y = Power$Global_active_power,type = "l",xlab ="", ylab = "Global Activ Power (kilowatts)")
plot(x = Power$Date, y = Power$Sub_metering_1,type = "l",xlab ="", ylab = "Energy sub metering")
lines(x = Power$Date, y = Power$Sub_metering_2, col="red")
lines(x = Power$Date, y = Power$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black" ,"red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x = Power$Date, y = Power$Voltage,type = "l",xlab ="datetime", ylab = "Energy sub metering")
plot(x = Power$Date, y = Power$Global_reactive_power,type = "l",xlab ="datetime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png")
dev.off()


