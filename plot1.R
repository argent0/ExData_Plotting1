householdPower <- read.csv("dataSubset.csv", stringsAsFactors= FALSE)

png(filename="plot1.png", width= 480, height= 480)

	par(bg="transparent")

	with(householdPower,
		  hist(Global_active_power,
				 col= "red",
				 xlab= "Global Active Power (kilowatts)",
				 main= "Global Active Power"))
dev.off()
