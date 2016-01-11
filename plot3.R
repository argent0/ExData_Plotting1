householdPower <- read.csv("dataSubset.csv", stringsAsFactors= FALSE)

# I use this to get english day names. See ?strptime.
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")

householdPower$MeasurementTime <- 
	strptime(
				apply(householdPower, 1,
						function(f) { paste(f[1],f[2],sep= " ") }),
				"%d/%m/%Y %T")

png(filename="plot3.png", width= 480, height= 480)

	# This is valid until the device(png) is closed
	par(bg="transparent")

	with(householdPower, {
		  plot(MeasurementTime,
				 Sub_metering_1,
				 xlab= NA,
				 ylab= "Energy sub meteriing",
				 type="l"
				 )

		  lines(MeasurementTime, Sub_metering_2, col="red")
		  lines(MeasurementTime, Sub_metering_3, col="blue")

	}) # end with

	legend("topright", col=c("black", "red", "blue"),
			 lwd= 1,
			 legend= c("Sub_metering_1",
						  "Sub_metering_2",
						  "Sub_metering_3"))
dev.off()

# Restore the original locale
Sys.setlocale("LC_TIME", lct)
