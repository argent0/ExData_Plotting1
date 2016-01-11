dataSubset.csv: data/household_power_consumption.txt subsetData.sh
	cat $< | ./subsetData.sh > $@

