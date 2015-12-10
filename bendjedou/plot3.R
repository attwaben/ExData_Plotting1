dat <- read.table("household_power_consumption.txt", sep = ";",header = TRUE, na.strings = "?")
#dat[dat == "?"] <- NA

library(dplyr)
library(lubridate)

dat1 <- tbl_df(dat)
dat1 <- filter(dat1, Date =="1/2/2007" | Date =="2/2/2007")
rm(dat)

dat1 <-mutate(dat1, Global_active_power = as.numeric(Global_active_power), Sub_metering_1 = as.numeric(Sub_metering_1),
              Sub_metering_2 = as.numeric(Sub_metering_2),Sub_metering_3 = as.numeric(Sub_metering_3),
              Global_reactive_power= as.numeric(Global_reactive_power),Voltage= as.numeric(Voltage))

dat1 <- mutate(dat1,Date=dmy(Date),Time=hms(Time) )

with(dat1, plot(Sub_metering_1,  main = " ",xlab = "",xaxt = "n", ylab = "Energy sub metering", type="l" ))
with(dat1, lines(Sub_metering_2, type="l", col = "red" ))
with(dat1, lines(Sub_metering_3, type="l", col = "blue" ))
axis(1, c(0, 1440, 2880), c("Thu", "Fri", "Sat"))
legend("topright", lty=c(1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file ="plot3.png")
dev.off()

