#load dataset
datos_completos<- read.table("household_power_consumption.txt",header = TRUE, sep = ";", na.strings="?")
# select the interval we want
datos <- datos_completos[(datos_completos$Date=="1/2/2007" | datos_completos$Date=="2/2/2007" ), ]
# paste date & Time
datos$Date<-as.Date(datos$Date,"%d/%m/%Y")
datos$Datetime<-as.POSIXct(paste(datos$Date, datos$Time), format="%Y-%m-%d %H:%M:%S")
#create plot
plot(datos$Datetime,datos$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
#create the png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()