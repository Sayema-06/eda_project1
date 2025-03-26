# Load required library
library(data.table)

# Load data
data <- fread("household_power_consumption.txt", na.strings = "?")

# Convert Date column to Date format
data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter data for 2007-02-01 and 2007-02-02
filtered_data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]

# Create Plot 2: Global Active Power Time Series
png("plot2.png", width = 480, height = 480)
plot(filtered_data$datetime, filtered_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
