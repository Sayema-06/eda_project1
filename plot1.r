# Load required library
library(data.table)

# Load data
data <- fread("household_power_consumption.txt", na.strings = "?")

# Convert Date column to Date format
data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter data for 2007-02-01 and 2007-02-02
filtered_data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]

# Create Plot 1: Global Active Power Histogram
png("plot1.png", width = 480, height = 480)
hist(filtered_data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
