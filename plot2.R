
library(sqldf)
rawdata <- "household_power_consumption.txt"
fi <- file(rawdata) 
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",stringsAsFactors = FALSE,file.format = list(header = TRUE,sep = ";"))
close(fi)
df[ df == "?" ] = NA
df$DateTime <- strptime(paste(df$Date,df$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")

png('plot2.png')
plot(df$DateTime,df$Global_active_power,type="l",ylab="Global Active Power(kw)",xlab='',col="navy")
dev.off()