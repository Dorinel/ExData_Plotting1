all_data <-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?") # read the data
#install.packages("lubridate")
# create a new variable Date_Time from the variables Date and Time
library(lubridate)
all_data$Date <- dmy(all_data$Date)
all_data$Time <- hms(all_data$Time)
all_data <- cbind(Date_Time = 0, all_data)
all_data$Date_Time <- all_data$Date + all_data$Time
#***************************************************
# subset only the needed observations
subset_data <- subset(all_data, all_data$Date >= "2007-02-01" & all_data$Date < "2007-02-03")
#**********************************************************************************************
# plot the data
png("plot3.png", width=480, height=480)
plot(subset_data$Date_Time, subset_data$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(subset_data$Date_Time, subset_data$Sub_metering_2, col = "red")
lines(subset_data$Date_Time, subset_data$Sub_metering_3, col = "blue")
legend ("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()



