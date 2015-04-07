plot1 <- function(){
    # if global variable d1 not exist...
    # call common function to load data 
    # from the dates 2007-02-01 and 2007-02-02 
    # and save d1 as global variable
    if(!exists("d1")){
        source("loadData.R")
        d1 <<- loadData()
    }
    
    # extract Global_active_power vector for easier reference
    ap <- d1$Global_active_power
    #remove NA values
    ap <- ap[!is.na(ap)]
    
    # open png device
    # construct histogram
    # close png device
    png(filename="plot1.png", width=480, height=480)
    hist(ap, col="red", xlab="Global Active Power (kilowatts)", 
            main="Global Active Power")
    dev.off()
}