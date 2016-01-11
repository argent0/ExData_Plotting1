householdPower <- read.csv("dataSubset.csv", stringsAsFactors= FALSE)

# I use this to get english day names. See ?strptime.
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")

householdPower$MeasurementTime <- 
	strptime(
				apply(householdPower, 1, function(f) { paste(f[1],f[2],sep= " ") }),
				"%d/%m/%Y %T")

png(filename="plot2.png", width= 480, height= 480)

	# This is valid until the device(png) is closed
	par(bg="transparent")

	with(householdPower,
		  plot(MeasurementTime,
				 Global_active_power,
				 xlab= NA,
				 ylab= "Global Active Power (kilowatts)",
				 type="l"
				 ))
dev.off()

# Restore the original locale
Sys.setlocale("LC_TIME", lct)
