# Installling  all the required packages
install.packages("randomForest")
install.packages("corrplot")

# Accessing all the packages 
library(corrplot)
library(ggplot2)
library(randomForest)
library(readxl)

# Reading the data
bike_data <- read_excel("D:/Users/Adesh Singh Tomar/Downloads/1657875746_day.xlsx")
View(bike_data)

# Checking Structure of Data
str(bike_data)


# Performing Data type conversion
bike_data$dteday <- as.Date(bike_data$dteday)

# Checking existance of null in data
summary(is.na(bike_data))

# Plotting Correlation Matrix
cor_matrix <- cor(bike_data[, c("temp", "atemp", "hum", "windspeed", "casual", "registered", "cnt")])
corrplot(cor_matrix, method = "color", type = "upper", order = "hclust", 
         addrect = 2, rect.col = "black", tl.col = "black", tl.srt = 45)

# Plotting Temprature and Humidity Analysis
ggplot(bike_data, aes(x = temp, y = hum)) +
  geom_point(aes(color = cnt)) +
  labs(title = "Temperature vs Humidity",
       x = "Temperature (Celsius)", y = "Humidity", color = "Total Bikes Rented")

# PLotting Seasonal Distribution of Bike
ggplot(bike_data, aes(x = season, fill = season)) +
  geom_bar() +
  labs(title = "Seasonal Distribution of Bikes Rented",
       x = "Season", y = "Total Bikes Rented")

# Plotting Weather situation Analysis
ggplot(bike_data, aes(x = weathersit, fill = weathersit))+
  geom_bar()+
  labs(title="Weather Situation Distribution", x = "Weather Situation",
       y = "Count")

# Plotting Day of the week Analysis
ggplot(bike_data, aes(x=weekday, fill=weekday))+
  geom_bar()+
  labs(title="Day of the Week Distribution",
       x = "Day of the Week", y = "Total Bikes Rented")

# Plotting Monthly Distribution
monthly_distribution <- aggregate(cnt~mnth, data = bike_data, sum)
ggplot(monthly_distribution, aes(x=factor(mnth), y = cnt))+
  geom_bar(stat = "identity", fill="steelblue")+
  labs(title = "Monthly Distribution of Bikes Rented",
       x= "Month", y = "Total Bikes Rented")

#PLotting Yearly Distribution
yearly_distribution <- aggregate(cnt~yr, data = bike_data, sum)
ggplot(yearly_distribution, aes(x=factor(yr), y= cnt))+
  geom_bar(stat = "identity", fill="darkgreen")+
  labs(title="Yearly Distribution of Bikes Rented",
       x="Year", y = "Total Bikes Rented")

# Plotting boxplot to detect outliers
boxplot(bike_data$cnt, main="Boxplot of Total Bikes Rented")

set.seed(123)  # for reproducibility
split_ratio <- 0.8 # Seeting splitting ratio

# Randomly split the data into training and testing sets
indices <- sample(1:nrow(bike_data), split_ratio * nrow(bike_data))
train_data <- bike_data[indices, ]
test_data <- bike_data[-indices, ]

# Checking null in train data
sum(is.na(train_data$season))

# Initializing the Random Forest Model
model <- randomForest(cnt~  yr + mnth + holiday + weekday + workingday+
                        weathersit + temp + atemp + hum + windspeed,
                      data = train_data, ntree=500)
print(model)

# Making predictions
predictions <- predict(model, newdata = test_data)

# Evaluating model performance
mae <- mean(abs(predictions - test_data$cnt))
rmse <- sqrt(mean((predictions - test_data$cnt)^2))

# Printing the resulted metrics for model evaluation
print(paste("Mean Absolute Error (MAE):", round(mae, 4)))
print(paste("Root Mean Squared Error (RMSE):", round(rmse, 4)))
