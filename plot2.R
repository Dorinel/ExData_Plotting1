# plot2.R
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
# plot the data
plot(subset_data$Date_Time, subset_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()

