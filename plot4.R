#load dataset
datos_completos<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
# select the interval we want
datos <- datos_completos[(datos_completos$Date=="1/2/2007" | datos_completos$Date=="2/2/2007" ), ]
# paste date & Time
datos$Date<-as.Date(datos$Date,"%d/%m/%Y")
datos$Datetime<-as.POSIXct(paste(datos$Date, datos$Time), format="%Y-%m-%d %H:%M:%S")
#configure the screen
par(mfrow=c(2,2))
#create 1 plot
plot(datos$Datetime,datos$Global_active_power,type="l",xlab="",ylab="Global Active Power")
#create 2 plot
plot(datos$Datetime,datos$Voltage,type="l",xlab="dateTime",ylab="Voltage", col="black")
#create 3 plot
plot(datos$Datetime,datos$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering", col="black")
lines(datos$Datetime,datos$Sub_metering_2, col="red")
lines(datos$Datetime,datos$Sub_metering_3, col="blue")
legend("topright", pch = "---", col = c("black", "red", "blue"),legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#create 4 plot
plot(datos$Datetime,datos$Global_reactive_power,type="l",xlab="dateTime",ylab="Global_Reactive_Power",col="black")
#create the png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()