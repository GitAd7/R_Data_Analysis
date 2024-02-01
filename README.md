# Bike Rental Prediction Analysis
This R script performs exploratory data analysis (EDA) and predicts bike rental counts based on environmental and seasonal settings using the random forest algorithm. The analysis involves loading the dataset, exploring its structure, handling missing values, visualizing patterns, and building a predictive model.

## How to run the code
1. Install Required Packages:
Make sure to install the necessary R packages as shown in code

2. Accessing Packages:
Load the required libraries for the analysis

3. Reading the Data:
Read the dataset from an Excel file.

4. Exploratory Data Analysis:
Explore the dataset structure, perform data type conversion, check for missing values, and visualize key attributes. Also plotted a Correlation Matrix
![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/b6d8cc57-e400-4ca7-a1fe-63df4343d8e3)

![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/b21197b9-a696-4d37-9d9b-f97aca5357ee)
In the above visulaization, I have shown a scatter plot between the humidity and temprature. From the plot we can easily see that count of rented bikes is less (dark blue dots) for the high range of humidity and low range of temprature. The reverse can be also be seen that when the temprature is high and the humidity is low the count of rented bikes increses (light blue dots).

![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/ec8f87f9-a39f-43b0-802d-8d5de9d1ba08)
In the above grpah I have plotted a Bar Graph to show Seasonal Distribution of Bike Rented. The graph has Different seasons (in numeric) on the x-axis and Count of bikes rented on the y-axis. Each Number on x-axis represent a season in the following order: 1 -> Spring, 2 -> Summer, 3 -> Fall, 4 -> Winter. As we can see that the count of bikes rented has continously increasing from spring to fall but drops a little in winter.

![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/adbf478f-6636-4197-887c-ba664e91045a)
In the above graph i have plotted a bar plot to show the bikes rented on the basis of the weather situation. The 1 represent the clear and sunny weather, 2 represents the Cloudy weather, 3 represents the Light snow or rain weather. As we can see that when the weahter is clear and sunny the most number of bikes are rented and this number drops rapidly as the weather changes. So we can say that the weather the bike is going to be rented or not is totally depends on weather situation.

![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/307aa5b4-a7b9-4386-b6a4-46a33b799227)
In the baove graph, i have plotted a bar chart to show the distrbution of rented bikes throughout the week. From the plot it is clearly indicated that the number of bikes rented do not change in a recordable manner throughout the week.
![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/e1d0a46b-00c7-46c1-9412-681fef55b646)
In the above plot, I have made a Bar graph to show the Monthly Distribution of bike Rented. From the plot it is clealry seen that the month with most bikes rented is August and the month with least bikes rented is January. This result totally support our analysis done for the weather situation, as during januray the cold weather is at peak with snow all around because of which less bikes are rented.
![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/c8eab9c7-c16f-4d0d-a6c2-e6e061297d62)
In the above plot, I have made a bar graph to show the Yearly Distribution of Bikes rented. As clealr seen that from the 2011 (representes as 0) the number of bikes rented are increases singnificantly in the year 2012.
![image](https://github.com/GitAd7/R_Data_Analysis/assets/107893872/d898c2e2-d87b-4c80-8c8a-0a50dd1c863a)
In the above plot, since the data we have is numeric so I plotted a box plot check if there are any outliers present in our data or not. As clealry seen from the plot that there are no outliers present in our data.

5. Data Splitting and Model Building:
Split the data into training and testing sets, and build a Random Forest model.

6. Model Evaluation:
Make predictions on the test dataset and evaluate model performance using Mean Absolute Error (MAE) and Root Mean Squared Error (RMSE).
