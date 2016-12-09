#load dataset
datos_completos<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
# select the interval we want
datos <- datos_completos[(datos_completos$Date=="1/2/2007" | datos_completos$Date=="2/2/2007" ), ]
# draw the histogram
hist(datos$Global_active_power, col = "red", xlab = "Global Active power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
#create the png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
