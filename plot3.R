## Reading the whole dataset
hpc <- read.table(file = "./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Subsetting the dataset
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(hpc)

## Working with Date and Time variables
DateTime <- paste(hpc_subset$Date,hpc_subset$Time)
hpc_subset$DateTime <- as.POSIXct(DateTime)

## Plot 3
with(hpc_subset, {
     plot(x=DateTime, y=Sub_metering_1, xlab="",
                      ylab="Energy sub Metering", type="l")
     lines(x=DateTime, y=Sub_metering_2, col="red", type="l")
     lines(x=DateTime, y=Sub_metering_3, col="blue", type="l")
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, lwd=1, col=c("black", "red", "blue"))

## Saving into .png file
dev.copy(png, file = "plot3.png", width=480, height=480)
dev.off()