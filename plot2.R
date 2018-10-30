
library(tidyverse)
Power<-read_delim(file = "./data/household_power_consumption.txt", na = "?",delim = ";",col_types = "ctnnnnnnn")
Power<-subset(Power, Date=="1/2/2007"|Date=="2/2/2007") 
Power$Date<-strptime(paste(Power$Date, Power$Time), "%d/%m/%Y %H:%M:%S")
plot(x = Power$Date, y = Power$Global_active_power,type = "l",xlab ="", ylab = "Global Activ Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()

