# Download and read data, originally from UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#  Check to see if data dir is there.If not, create it, then download
if (dir.exists("data") == FALSE) {
     dir.create("data")
download.file(fileUrl,destfile="./data/exdata_data_household_power_consumption.zip")
}

# Unzip
# The file should be in the data\UCI HAR Dataset now.
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")
# Data from 
d <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Eliminate na values
d <- d[complete.cases(d),]

# Filter only Feb 1st and 2nd, 2007
d <- d[grep("^1/2/2007|^2/2/2007",d$Date),]

# Plot graph
png(file = "plot1.png")
hist(d$Global_active_power, col = "red", main = "Global Active Power", breaks = 15, xlab = "Global Active Power (kilowatts)")
dev.off()
