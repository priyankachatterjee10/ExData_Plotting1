# read the file from Downloads folder on your computer
household_power_consumption <- read.csv("~/Downloads/household_power_consumption.txt", sep=";")

# subset the dates for Feb 1 and Feb 2 2007
d.sub <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007")
g.sub <- subset(household_power_consumption, household_power_consumption$Date == "2/2/2007")

# combine the two subsets
use <- rbind(d.sub, g.sub)

# make datetime column to change to posix variable
use$DateTime <- paste(use$Date, use$Time, sep=" ")
use$DateTime <- strptime(use$DateTime, format = "%d/%m/%Y %H:%M:%OS")
use$DateTime <- as.numeric(use$DateTime)

# for weekdays
use$Date <- as.Date(use$Date, tryFormats = c("%d/%m/%Y"))
use$Weekday <- weekdays(use$Date)

# opening the png device
png(filename = "plot2.png", width = 480, height = 480, units = "px")
# making the plot
plot(use$DateTime, use$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "", xaxt = "n") +
    axis(1, at = c(1170306000, 1170392400, 1170478740),labels = c("Thursday", "Friday", "Saturday"))
dev.off()


