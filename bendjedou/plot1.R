
 dat <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?")
 
 
 library(dplyr)
 library(lubridate)
 
 dat1 <- tbl_df(dat)
 dat1 <- filter(dat1, Date =="1/2/2007" | Date =="2/2/2007")
 rm(dat)
 
 dat1 <-mutate(dat1, Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1),
                  Sub_metering_2 = as.numeric(Sub_metering_2),Sub_metering_3 = as.numeric(Sub_metering_3),
                 Global_reactive_power= as.numeric(Global_reactive_power),Voltage= as.numeric(Voltage))
 
 dat1 <- mutate(dat1,Date=dmy(Date),Time=hms(Time) )
 with(dat1, hist(Global_active_power, main ="Global Active Power", xlab = "Global active power (kilowatts)", col = "red"))
 dev.copy(png, file ="plot1.png")
 dev.off()
 



 
 
 
 
 
 
 
 
 