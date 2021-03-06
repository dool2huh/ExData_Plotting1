
## load data
file <- "household_power_consumption.txt"
hpc <- read.table(file, header = FALSE, sep = ";", skip = 1, colClasses = c(rep("character",  2), rep("numeric", 7)), na.strings = "?")
cnames <- readLines(file, 1)
cnames <- strsplit(cnames, ";", fixed = TRUE)
names(hpc) <- cnames[[1]]

## filter by dates
hpc <- hpc[hpc$Date %in% c("1/2/2007", "2/2/2007"),] 

## date time column
datetime <- paste(hpc$Date, hpc$Time)

hpc$Date_Time <- strptime(datetime, "%d/%m/%Y %H:%M:%S")                                 ]


plot(x = hpc$Date_Time, y = hpc$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

