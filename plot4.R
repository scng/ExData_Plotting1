plot4 <- function(){
    # if global variable d1 not exist...
    # call common function to load data 
    # from the dates 2007-02-01 and 2007-02-02 
    # and save data as global variable d1
    if(!exists("d1")){
        source("loadData.R")
        d1 <<- loadData()
    }
    
    # extract Global_active_power vector for easier reference
    ap <- d1$Global_active_power
    #remove NA values
    ap <- ap[!is.na(ap)]
    
    # extract Voltage vector for easier reference
    v1 <- d1$Voltage
    #remove NA values
    v1 <- v1[!is.na(v1)]
    
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
    
    # extract Global_reactive_power vector for easier reference
    rp <- d1$Global_reactive_power
    #remove NA values
    rp <- rp[!is.na(rp)]
    
    # extract Time vector for easier reference
    dow <- d1$Time
    
    # open png device
    png(filename="plot4.png", width=480, height=480)
    
    # par assign plots in 2x2 rows
    par(mfrow=c(2,2))
    
    # generate the topleft plot ("Global_active_power" vs "Time")
    plot(dow, ap, type="n", 
         xlab="", ylab="Global Active Power (kilowatts)")
    lines(dow, ap)
    
    # generate the topright plot ("Voltage" vs "Time)
    plot(dow, v1, type="n", 
         xlab="datetime", ylab="Voltage")
    lines(dow, v1)
    
    # generate the bottomleft plot ("Sub_metering_1/2/3" vs "Time)
    plot(dow, m1, type="n", 
         xlab="", ylab="Energy sub metering")
    lines(dow, m1)
    lines(dow, m2, col="red")
    lines(dow, m3, col="blue")
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           col=c("black", "red", "blue"), lty=c(1,1,1))
    
    # generate the bottomright plot ("Global_reactive_power" vs "Time)
    plot(dow, rp, type="n", 
         xlab="datetime", ylab="Global_reactive_power")
    lines(dow, rp)
    
    # close png device
    dev.off()
}