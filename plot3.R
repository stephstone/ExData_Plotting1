
library(sqldf)
rawdata <- "household_power_consumption.txt"
fi <- file(rawdata) 
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",stringsAsFactors = FALSE,file.format = list(header = TRUE,sep = ";"))
close(fi)
df[ df == "?" ] = NA
df$DateTime <- strptime(paste(df$Date,df$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")

png('plot3.png')
plot(df$DateTime,df$Sub_metering_1,type="n",ylab="Energy sub metering",xlab='')
lines(df$DateTime,df$Sub_metering_1,col="red")
lines(df$DateTime,df$Sub_metering_2,col="blue")
lines(df$DateTime,df$Sub_metering_3,col="green")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c('red','blue','green'))
dev.off()