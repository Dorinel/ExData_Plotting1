# plot1.R
all_data <-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?") # read data
#install.packages("lubridate")
library(lubridate)
all_data$Date <- dmy(all_data$Date)
all_data$Time <- hms(all_data$Time)
all_data <- cbind(Date_Time = 0, all_data)
all_data$Date_Time <- all_data$Date + all_data$Time
# subset only the observations needed
subset_data <- subset(all_data, all_data$Date >= "2007-02-01" & all_data$Date < "2007-02-03")
#**********************************************************************************************
hist(subset_data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
