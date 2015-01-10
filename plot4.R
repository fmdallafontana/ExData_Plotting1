## Reading the whole dataset
hpc <- read.table(file = "./Data/household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

## Subsetting the dataset
hpc_subset <- subset(hpc, subset=(Date == "2007-02-01" | Date == "2007-02-02"))
rm(hpc)

## Working with Date and Time variables
DateTime <- paste(hpc_subset$Date,hpc_subset$Time)
hpc_subset$DateTime <- as.POSIXct(DateTime)

## Plot 4
par(mfrow = c(2, 2), cex=0.7)
with(hpc_subset, {
     
     plot(x=DateTime, y=Global_active_power, xlab="",
          ylab="Global Active Power", type="l")
     
     plot(x=DateTime, y=Voltage, xlab="datetime", 
          ylab="Voltage", type="l")

     plot(x=DateTime, y=Sub_metering_1, xlab="", 
          ylab="Energy sub Metering", type="l")
     lines(x=DateTime, y=Sub_metering_2, col="red", type="l")
     lines(x=DateTime, y=Sub_metering_3, col="blue", type="l")
     legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            lty=1, lwd=1, bty="n", col=c("black", "red", "blue"))
     
     plot(x=DateTime, y=Global_reactive_power, xlab="datetime", 
          ylab="Global_reactive_power", type="l")
})

## Saving into .png file
dev.copy(png, file = "plot4.png", width=480, height=480)
dev.off()