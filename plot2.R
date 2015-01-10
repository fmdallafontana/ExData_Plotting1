## Reading the whole dataset
hpc <- read.table(file = "./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Subsetting the dataset
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(hpc)

## Working with Date and Time variables
DateTime <- paste(hpc_subset$Date,hpc_subset$Time)
hpc_subset$DateTime <- as.POSIXct(DateTime)

## Plot 2
with(hpc_subset, plot(x=DateTime, y=Global_active_power, xlab="",
     ylab="Global Active Power (kilowatts)", type="l"))

## Saving into .png file
dev.copy(png, file = "plot2.png", width=480, height=480)
dev.off()