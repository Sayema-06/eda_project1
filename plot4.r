# Load required library
library(data.table)

# Load data
data <- fread("household_power_consumption.txt", na.strings = "?")

# Convert Date column to Date format
data[, Date := as.Date(Date, format = "%d/%m/%Y")]

# Filter data for 2007-02-01 and 2007-02-02
filtered_data <- data[Date >= "2007-02-01" & Date <= "2007-02-02"]

# Combine Date and Time into a single datetime column
filtered_data[, datetime := as.POSIXct(paste(Date, Time), format = "%Y-%m-%d %H:%M:%S")]

# Create Plot 4: Multiple Plots
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(filtered_data$datetime, filtered_data$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage
plot(filtered_data$datetime, filtered_data$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3: Sub-Metering
plot(filtered_data$datetime, filtered_data$Sub_metering_1,
     type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(filtered_data$datetime, filtered_data$Sub_metering_2, col = "red")
lines(filtered_data$datetime, filtered_data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(filtered_data$datetime, filtered_data$Global_reactive_power,
     type = "l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()
