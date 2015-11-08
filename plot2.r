# Download and read data, originally from UC Irvine Machine Learning Repository (http://archive.ics.uci.edu/ml/)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#  Check to see if data dir is there.If not, create it, then download
if (dir.exists("data") == FALSE) {
     dir.create("data")
download.file(fileUrl,destfile="./data/exdata_data_household_power_consumption.zip")
}

# Unzip and read in data
unzip(zipfile="./data/exdata_data_household_power_consumption.zip",exdir="./data")
d <- read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?")

# Eliminate na values
d <- d[complete.cases(d),]

# Filter only Feb 1st and 2nd, 2007
d <- d[grep("^1/2/2007|^2/2/2007",d$Date),]

# Create new variable of type date
d$datetime <- paste(d$Date, d$Time, sep = " ")
d$datetime <- strptime(d$datetime, "%d/%m/%Y %H:%M:%S")

# Plot graph
png(file = "plot2.png")
plot(d$datetime, d$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
