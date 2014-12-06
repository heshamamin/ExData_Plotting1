#filter data to include only 1/2/2007 and 2/2/2007
system("head --lines 1 ./data/household_power_consumption.txt  > ./data/filtered.txt")
system("cat ./data/household_power_consumption.txt | grep -e ^1/2/2007 -e ^2/2/2007 >> ./data/filtered.txt")

#read data
elec <- read.table(file = "./data/filtered.txt", header = T, sep = ";", na.strings = "?", stringsAsFactors = FALSE)

#plot
png(filename = "plot1.png", width = 480, height = 480)
hist(elec$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "Red", main = "Global Active Power")
dev.off()