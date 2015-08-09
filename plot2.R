data_whole <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, colClasses=c(Date = "character", Time = "character", rep("numeric",7)), na.strings = "?")
data_whole$Date <- as.Date(data_whole$Date, "%d/%m/%Y")
data_power <- subset(data_whole, data_whole$Date == c("2007-02-01", "2007-02-02"))
data_plot <- data.frame(Time = strptime(paste(data_power$Date,data_power$Time, sep=" "), format = "%Y-%m-%d %H:%M:%S"), Gobal_active_power = data_power$Global_active_power)
plot(data_plot$Time, data_plot$Gobal_active_power,type="n",ylab="Global Active Power (kilowatts)", xlab = "")
lines(data_plot$Time, data_plot$Gobal_active_power)
dev.copy(png, file = "plot2.png")
dev.off()datadev
