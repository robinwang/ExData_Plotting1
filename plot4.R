plot4 <- function(){
    ## Read file with data from the dates
    ## 2007-02-01 to 2007-02-02
    ## Assume household_power_consumption.txt is placed under working directory
    file_name       <- "household_power_consumption.txt"
    column_name     <- read.table(file_name, header = FALSE, sep = ";",
                                  nrows = 1)
    data_set        <- read.table(file_name, header = FALSE, sep = ";",
                                  na.strings = "?",nrows = 2880,skip = 66637)
    names(data_set) <- as.vector(t(column_name))
    ## Plot active power histogram to png file
    par(mfrow=c(2,2))
    plot(strptime(paste(data_set$Date,data_set$Time,
                        sep = " "),
                  "%d/%m/%Y %H:%M:%S"),
         data_set$Global_active_power,type = "l",
         xlab = "", ylab = "Global Active Power (kilowatts)")
    plot(strptime(paste(data_set$Date,data_set$Time,
                        sep = " "),
                  "%d/%m/%Y %H:%M:%S"),
         data_set$Voltage,type = "l",
         xlab = "datetime", ylab = "Voltage") 
    plot(strptime(paste(data_set$Date,data_set$Time,
                        sep = " "),
                  "%d/%m/%Y %H:%M:%S"),
         data_set$Sub_metering_1,type = "l",
         xlab = "", ylab = "Energy sub metering")
    points(strptime(paste(data_set$Date,data_set$Time,
                          sep = " "),
                    "%d/%m/%Y %H:%M:%S"),
           data_set$Sub_metering_2,type = "l",col="red")
    points(strptime(paste(data_set$Date,data_set$Time,
                          sep = " "),
                    "%d/%m/%Y %H:%M:%S"),
           data_set$Sub_metering_3,type = "l",col="blue")     
    legend("topright", col = c("black","red","blue"),
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
           lty = 1, lwd = 1, bty = "n")
    plot(strptime(paste(data_set$Date,data_set$Time,
                        sep = " "),
                  "%d/%m/%Y %H:%M:%S"),
         data_set$Global_reactive_power,type = "l",
         xlab = "datetime", ylab = "Global_reactive_power")    
    dev.copy(png, "plot4.png")
    dev.off()
}