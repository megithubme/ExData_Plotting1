# plot3.R

########### STEPS FOR CREATING THE DATASET WITH THE DATES 2007-02-01 and 2007-02-02
#  1 - GET THE COLUMN HEADERS
x <- read.table('household_power_consumption.txt', na.strings = "?", nrows=1, sep=";", header=T)
#  2 - CALCULATE THE ROW WHERE THE FIRST ENTRY FOR 2007-02-01 APPEARS
#      6O MINUTES PER HOUR * 24 HOURS PER DAY * 46 DAYS + THE # OF ENTRIES IN THE FIRST DAY (397)
startrow = 60 * 24 * 46 + 397
#  3 - CALCULATE THE # OF ROWS FOR 2 DAYS:  60 MINUTES * 24 HOURS * 2 DAYS
numrows = 60 * 24 * 2
#  4 - READ THE DATA INTO THE DATA TABLE
powerConsumptionDT <- read.table('household_power_consumption.txt', na.strings = "?", skip=startrow, nrows=numrows, sep=";")
#  5 - PUT THE COLNAMES ON
colnames(powerConsumptionDT) <- colnames(x)

# CREATING A DATETIME COLUMN FOR THE PLOT:  THE DATE AND TIME COLUMNS ARE CHARACTER VECTORS - PASTE THEM TOGETHER, THEN CREATE A DATETIME OBJECT AS A NEW COLUMN
powerConsumptionDT$DateAndTime <- strptime(paste(powerConsumptionDT$Date, powerConsumptionDT$Time), "%d/%m/%Y %H:%M:%S")

#  CREATE THE 3RD PLOT; ARG TO png() IS THE FILE NAME AND LOCATION RELATIVE TO THE WORKING DIRECTORY
png('ExData_Plotting1/figure/plot3.png')
# PLOT THE 1ST Y VARIABLE
plot(powerConsumptionDT$DateAndTime, powerConsumptionDT$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
# ADD THE 2ND Y VARIABLE
lines(powerConsumptionDT$DateAndTime, powerConsumptionDT$Sub_metering_2, type="l", col="red")
# ADD THE 3RD Y VARIABLE
lines(powerConsumptionDT$DateAndTime, powerConsumptionDT$Sub_metering_3, type="l", col="blue")
# ADD THE LEGEND
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()
