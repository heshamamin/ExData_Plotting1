system("head --lines 1 ./data/household_power_consumption.txt  > ./data/filtered.txt")
system("cat ./data/household_power_consumption.txt | grep -e ^1/2/2007 -e ^2/2/2007 >> ./data/filtered.txt")

elec <- read.table(file = "./data/filtered.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

elec$DateTime <- strptime(paste(elec$Date,elec$Time,sep="-"), format = "%d/%m/%Y-%H:%M:%S")

png(filename = "plot2.png", width = 480, height = 480)
plot(x=elec$DateTime,y= elec$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()