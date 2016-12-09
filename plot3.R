#load dataset
datos_completos<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
# select the interval we want
datos <- datos_completos[(datos_completos$Date=="1/2/2007" | datos_completos$Date=="2/2/2007" ), ]
# paste date & Time
datos$Date<-as.Date(datos$Date,"%d/%m/%Y")
datos$Datetime<-as.POSIXct(paste(datos$Date, datos$Time), format="%Y-%m-%d %H:%M:%S")
#create plot
png(filename = "Plot3.png",width = 480, height = 480)
plot(datos$Datetime,datos$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering", col="black")
lines(datos$Datetime,datos$Sub_metering_2, col="red")
lines(datos$Datetime,datos$Sub_metering_3, col="blue")
legend("topright", pch = "---", col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()