#loadData function download, unzip, and read data for Coursera 
#Exploratory Data Analysis course Programming Assignment 1
loadData <- function() {
    url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    datapath <- "./data"
    if(!file.exists(datapath)) {
        # if "data" folder not exist, create folder
        dir.create(datapath)
    }
    zipfile <- paste(datapath, "/ex1.zip", sep="")
    if(!file.exists(zipfile)) { 
        # if zip file not exist in "./data" folder, 
        # download zip file and and perform unzip
        download.file(url, zipfile, method="curl")
        unzip(zipfile, exdir=datapath)
    }
    datafile <- paste(datapath, "/household_power_consumption.txt", sep="")
    
    # read data file into R memory
    # specify colClasses to improve performance
    # read first 2 columns as characters in this moment
    data <- read.csv(file=datafile, sep=";", 
                     stringsAsFactors=FALSE, na.strings=c("?"),
                     colClasses=c("character", "character", 
                                  "numeric", "numeric", "numeric", 
                                  "numeric", "numeric", "numeric", 
                                  "numeric"))
    
    # convert the second column into POSIXct type
    # assume all Datetime timezone in GMT
    data$Time <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S", tz="GMT")
    # convert the first column into Date type
    data$Date <- as.Date(data$Date, format="%d/%m/%Y", tz="GMT")
    
    # read data from the dates 2007-02-01 and 2007-02-02
    # for the most accurate result, filter the subset using the converted "Time" column
    mindt <- as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="GMT")
    maxdt <- as.POSIXct("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S", tz="GMT")
    d2 <- data[((data$Time >= mindt) & (data$Time < maxdt)),]
    
    # return data 
    d2
}