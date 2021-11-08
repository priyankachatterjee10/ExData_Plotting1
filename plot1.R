# read the file from Downloads folder on your computer
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# subset the dates for Feb 1 and Feb 2 2007
d.sub <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007")
g.sub <- subset(household_power_consumption, household_power_consumption$Date == "2/2/2007")

# combine the two subsets
use <- rbind(d.sub, g.sub)

use$Global_active_power <- as.numeric(use$Global_active_power)

# opening the png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")
# making the histogram
hist(use$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()
