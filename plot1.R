## Reading the whole dataset
hpc <- read.table(file = "./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Subsetting the dataset
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(hpc)

## Plot 1
with(hpc_subset, hist(Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red"))

## Saving into .png file
dev.copy(png, file = "plot1.png", width=480, height=480)
dev.off()