#filter data to include only 1/2/2007 and 2/2/2007
system("head --lines 1 ./data/household_power_consumption.txt  > ./data/filtered.txt")
system("cat ./data/household_power_consumption.txt | grep -e ^1/2/2007 -e ^2/2/2007 >> ./data/filtered.txt")

#read data
elec <- read.table(file = "./data/filtered.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#set date time to be used in plots
elec$DateTime <- strptime(paste(elec$Date,elec$Time,sep="-"), format = "%d/%m/%Y-%H:%M:%S")


#plot
png(filename = "plot4.png", width = 480, height = 480)

#setup:
par(mfrow = c(2,2))

#1st plot
plot(x=elec$DateTime,y= elec$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#2nd plot
plot(x=elec$DateTime,y= elec$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#3rd plot:
plot(x=elec$DateTime,y= elec$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(x=elec$DateTime,y= elec$Sub_metering_2, type = "l", col = "red")
lines(x=elec$DateTime,y= elec$Sub_metering_3, type = "l", col = "purple")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "purple"), lty = c(1,1), bty = "n")


#4th plot:
plot(x=elec$DateTime,y= elec$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()