#  plot2.R

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

#  CREATE THE 2ND PLOT; ARG TO png() IS THE FILE NAME AND LOCATION RELATIVE TO THE WORKING DIRECTORY
png('ExData_Plotting1/figure/plot2.png')
#  CREATE THE PLOT ON THE APPROPRIATE COLUMN, WITH THE RIGHT COLOUR AND LABELS
plot(powerConsumptionDT$DateAndTime,powerConsumptionDT$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="" )
#  THIS SEEMS TO COMPLETE THE OPERATION AND ACTUALLY WRITE THE FILE OUT
dev.off()
