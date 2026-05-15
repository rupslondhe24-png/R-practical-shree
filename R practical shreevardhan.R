# Q1) Data C;ening and Transformation
#you are given the following dataset:
#df<-data.frame(
#name = c("Raj","Amit","Neha","raj","Amit"),
# marks = c("80", "90", NA "85","90"),
# city = c("Pune", "pune," "Mumbai", "PUNE", "Mumbai")
#)
#Perform the following tasks:
#  1. Remove extra spaces from the name column
#  2. Convert all name to lowercase
#  3. Convert marks column to numaric and handle missing values 
#  4. Standardize city name (all lowercase)
#  5. Filter students with marks greater than 80 
#  6. Create a new column grade:
#        . Marks >= 85 "A"
#        . Marks < 85 "B"


# 1. Remove extra spaces from name column
df$name <- trimws(df$name)
df

# 2. Convert all names to lowercase
df$name <- tolower(df$name)
df

# 3. Convert marks column to numeric
df$marks <- as.numeric(df$marks)
df
# Handle missing values by replacing NA with mean
df$marks[is.na(df$marks)] <- mean(df$marks, na.rm = TRUE)
df

# 4. Standardize city names to lowercase
df$city <- tolower(df$city)
df

# 5. Filter students with marks greater than 80
high_marks <- df[df$marks > 80, ]
high_marks

# 6. Create a new column grade:
# condition should be :- 1) 
# Marks >= 85 -> "A"
# Marks <= 85 -> "B"
# 6. Create new column grade
df$grade <- ifelse(df$marks >= 85, "A", "B")
print(df) 


# Q2) Data Manipulation & Aggreation
#Creat the dataset:


#sales<-data.frame(
#Product = sample("Laptop", "Mobile", "Tablet"),50, replace=TRUE),
# City = sample(c("Pune","Mumbai", "Delhi"),50, replace=TRUE),
# Price= sample(1:5,50,replace=TRUE),
#)
#sales$Revenue<-sales$Quntity * sales$Price
#Task:
#  1. Show Records where Revenue > 100000.
#  2. Sort data by Revenue in descending order.
#  3. Find total revenue by city. 
#  4. Identify the product with highest total Revenue


# 1. Show records where Revenue > 100000
high_revenue <- sales[sales$Revenue > 100000, ]
print(high_revenue)

# 2. Sort data by Revenue in descending order
sorted_data <- sales[order(-sales$Revenue), ]
print(sorted_data)

# 3. Find total revenue by City
city_revenue <- aggregate(Revenue ~ City, data = sales, sum)
print(city_revenue)

# 4. Find average price by Product
avg_price <- aggregate(Price ~ product, data = sales, mean)
print(avg_price)

# 5. Identify product with highest total revenue
product_revenue <- aggregate(Revenue ~ product, data = sales, sum)

highest_product <- product_revenue[which.max(product_revenue$Revenue), ]
print(highest_product)
