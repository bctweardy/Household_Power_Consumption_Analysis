## Reading the data into R Studio
the_data <- "C:\\Users\\Brad and Kathleen\\Documents\\Coursera\\EDA\\exdata-data-household_power_consumption\\household_power_consumption.txt"
data <- read.table(the_data, header = TRUE, sep = ";", na.string = "?", 
                   col.names = c("Date", "Time", 
                                 "Global_Active_Power", "Global_Reactive_Power", "Voltage", 
                                 "Global_Intensity", "Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

## Formatting Dates and Times in the file.
as.Date(data$Date, format = "%d-%m-%Y")
strptime(data$Time, format = "H%:M%:S%")

## Creating a data frame of the data.
Master <- data.frame(data)

## Extracting the two dates and creating a data set for each. 
## Then use rbind() to combine the two sets of data. 
Master1 <- Master[Master$Date == "1/2/2007", ]
Master2 <- Master[Master$Date == "2/2/2007", ]
Master3 <- rbind(Master1, Master2)    ##Data set of both dates combined.


png("plot1.png", width = 480, height = 480)

hist(Master3$Global_Active_Power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

dev.off()

