plot1 <- function(){
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
    hist(data_set$Global_active_power,
         xlab = "Global Active Power (kilowatts)",
         main = "Global Active Power",
         col = "red")
    dev.copy(png, "plot1.png")
    dev.off()
}