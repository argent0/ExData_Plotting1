householdPower <- read.csv("dataSubset.csv", stringsAsFactors= FALSE)

# I use this to get english day names. See ?strptime.
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")

householdPower$MeasurementTime <- 
	strptime(
				apply(householdPower, 1,
						function(f) { paste(f[1],f[2],sep= " ") }),
				"%d/%m/%Y %T")

png(filename="plot4.png", width= 480, height= 480)

   par(mfcol= c(2,2))

	# This is valid until the device(png) is closed
	par(bg="transparent",
		 ps=10,
		 mar=c(5,3.9,3.8,2))

	with(householdPower, {
			  # top right
			  plot(MeasurementTime,
					 Global_active_power,
					 xlab= NA,
					 ylab= "Global Active Power",
					 type="l"
					 )

			  #bottom right
			  plot(MeasurementTime,
					 Sub_metering_1,
					 xlab= NA,
					 ylab= "Energy sub meteriing",
					 type="l"
					 )

			  lines(MeasurementTime, Sub_metering_2, col="red")
			  lines(MeasurementTime, Sub_metering_3, col="blue")

			  legend("topright", col=c("black", "red", "blue"),
						lwd= 1,
						box.lwd = 0,
						legend= c("Sub_metering_1",
									 "Sub_metering_2",
									 "Sub_metering_3"))

			  plot(MeasurementTime,
					 Voltage, type="l",
					 xlab="datetime")

			  plot(MeasurementTime,
					 Global_reactive_power, type="l",
					 xlab="datetime")


	}) # end with

dev.off()

# Restore the original locale
Sys.setlocale("LC_TIME", lct)
