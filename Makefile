all:
	make plot1.png

plot1.png: plot1.R dataSubset.csv
	R --slave --quiet < $<

dataSubset.csv: data/household_power_consumption.txt subsetData.sh
	cat $< | ./subsetData.sh > $@

