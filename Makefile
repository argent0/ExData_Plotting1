all:
	make plot1.png
	make plot2.png
	make plot3.png
	make plot4.png

plot1.png: plot1.R dataSubset.csv
	R --slave --quiet < $<

plot2.png: plot2.R dataSubset.csv
	R --slave --quiet < $<

plot3.png: plot3.R dataSubset.csv
	R --slave --quiet < $<

plot4.png: plot4.R dataSubset.csv
	R --slave --quiet < $<

dataSubset.csv: data/household_power_consumption.txt subsetData.sh
	cat $< | ./subsetData.sh > $@
