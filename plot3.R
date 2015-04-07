plot3 <- function(){
    # if global variable d1 not exist...
    # call common function to load data 
    # from the dates 2007-02-01 and 2007-02-02 
    # and save data as global variable d1
    if(!exists("d1")){
        source("loadData.R")
        d1 <<- loadData()
    }
    
    # extract Sub_metering_1 vector for easier reference
    m1 <- d1$Sub_metering_1
    #remove NA values
    m1 <- m1[!is.na(m1)]
    
    # extract Sub_metering_2 vector for easier reference
    m2 <- d1$Sub_metering_2
    #remove NA values
    m2 <- m2[!is.na(m2)]
    
    # extract Sub_metering_3 vector for easier reference
    m3 <- d1$Sub_metering_3
    #remove NA values
    m3 <- m3[!is.na(m3)]
    
    # extract Time vector for easier reference
    dow <- d1$Time
    
    # open png device with width and height = 480 pixels
    png(filename="plot3.png", width=480, height=480)
    
    # generate plot of type "n" (i.e. no plotting)
    plot(dow, m1, type="n", 
         xlab="", ylab="Energy sub metering")
    
    # add lines plots for sub_metering_1/2/3 respectively
    lines(dow, m1, col="black")
    lines(dow, m2, col="red")
    lines(dow, m3, col="blue")
    
    #add legend at the topright corner 
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black", "red", "blue"), lty=c(1,1,1))
    
    # close png device
    dev.off()
}