all_data <-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?") # read the data
#install.packages("lubridate")
library(lubridate)
# create a new variable Date_Time from the variables Date and Time
all_data$Date <- dmy(all_data$Date)
all_data$Time <- hms(all_data$Time)
all_data <- cbind(Date_Time = 0, all_data)
all_data$Date_Time <- all_data$Date + all_data$Time
#***************************************************
# subset only the needed observations
subset_data <- subset(all_data, all_data$Date >= "2007-02-01" & all_data$Date < "2007-02-03")
#**********************************************************************************************
#plot the data
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
with (subset_data, {
    plot(Date_Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
    plot(Date_Time, Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
    plot(Date_Time, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
    lines(Date_Time, Sub_metering_2, col = "red")
    lines(Date_Time, Sub_metering_3, col = "blue")
    legend ("topright", lty = "solid", bty = "n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
    plot(Date_Time, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()




