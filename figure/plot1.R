# plot1.R

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

#  CREATE THE 1ST PLOT; ARG TO png() IS THE FILE NAME AND LOCATION RELATIVE TO THE WORKING DIRECTORY
png('ExData_Plotting1/figure/plot1.png')
#  CREATE THE HISTOGRAM ON THE APPROPRIATE COLUMN, WITH THE RIGHT COLOUR AND LABELS
hist(powerConsumptionDT$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
#  THIS SEEMS TO COMPLETE THE OPERATION AND ACTUALLY WRITE THE FILE OUT
dev.off()
