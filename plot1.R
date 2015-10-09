
library(sqldf)
rawdata <- "household_power_consumption.txt"
fi <- file(rawdata) 
df <- sqldf("select * from fi where Date in('1/2/2007','2/2/2007')",stringsAsFactors = FALSE,file.format = list(header = TRUE,sep = ";"))
close(fi)
df[ df == "?" ] = NA
df$DateTime <- strptime(paste(df$Date,df$Time,sep = " "),format = "%d/%m/%Y %H:%M:%S")

png('plot1.png')
hist(df$Global_active_power,main="Global Active Power",xlab="Global Active Power(kw)",ylab="Frequency",col="magenta",yaxt="n")
axis(2, at = seq(0,1200,by=200),las=2)
dev.off()