# ==============================================================================
# subject : Data Analysis with R Programming (DTS-162-PR)
# Assignment 5: Data Visualization with ggplot2 in R
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Remove the '#' on the line below to install the package for the first time
# install.packages("ggplot2")

# Load required library
library(ggplot2)

# Load the provided dataset
# Note: Ensure 'sales_data.csv' is in the current working directory
sales_data <- read.csv("sales_data.csv")

cat("\n--- Q1) Basic ggplot Charts ---\n")
# a) Scatter plot of Price vs Revenue
p1a <- ggplot(sales_data, aes(x = Price, y = Revenue)) +
  geom_point(color = "darkblue") +
  labs(title = "Scatter plot of Price vs Revenue")
print(p1a)

# b) Bar chart for City
p1b <- ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "steelblue") +
  labs(title = "Bar chart for City")
print(p1b)

# c) Histogram of Price
p1c <- ggplot(sales_data, aes(x = Price)) +
  geom_histogram(bins = 10, fill = "darkgreen", color = "white") +
  labs(title = "Histogram of Price")
print(p1c)

# d) Boxplot of Revenue by Category
p1d <- ggplot(sales_data, aes(x = Category, y = Revenue, fill = Category)) +
  geom_boxplot() +
  labs(title = "Boxplot of Revenue by Category")
print(p1d)

# e) Line chart for Revenue by OrderID
p1e <- ggplot(sales_data, aes(x = OrderID, y = Revenue)) +
  geom_line(color = "red", size = 1) +
  labs(title = "Line chart for Revenue by OrderID")
print(p1e)

cat("\n--- Q2) Customized Visualization ---\n")
# Customized Bar Chart with titles, labels, colors, theme, and rotated axes
p2 <- ggplot(sales_data, aes(x = City)) +
  geom_bar(fill = "purple") +                                      
  labs(title = "Total Orders Distribution by City",                
       x = "City Name",                                            
       y = "Number of Orders") +                                   
  theme_minimal() +                                                
  theme(axis.text.x = element_text(angle = 45, hjust = 1))         
print(p2)

cat("\n--- Q3) Multi-Variable Visualization ---\n")
# a) Price vs Revenue colored by Category
p3a <- ggplot(sales_data, aes(x = Price, y = Revenue, color = Category)) + geom_point(size = 3)
print(p3a)

# b) Price vs Quantity colored by Category
p3b <- ggplot(sales_data, aes(x = Price, y = Quantity, color = Category)) + geom_point(size = 3)
print(p3b)

# c) Revenue vs Discount
p3c <- ggplot(sales_data, aes(x = Discount, y = Revenue)) + geom_point(color = "darkred")
print(p3c)

# d) Top cities by revenue
city_revenue <- aggregate(Revenue ~ City, data = sales_data, sum)
p3d <- ggplot(city_revenue, aes(x = reorder(City, -Revenue), y = Revenue, fill = City)) +
  geom_bar(stat = "identity") +
  labs(title = "Top Cities by Revenue", x = "City")
print(p3d)

# e) Top products by sales (Quantity)
product_sales <- aggregate(Quantity ~ Product, data = sales_data, sum)
p3e <- ggplot(product_sales, aes(x = reorder(Product, -Quantity), y = Quantity, fill = Product)) +
  geom_bar(stat = "identity") +
  labs(title = "Top Products by Quantity Sold", x = "Product")
print(p3e)

cat("\n--- Q4 & Q5) Advanced Analysis Charts Generated ---\n")
# Example of Faceted Chart (Q5e)
p5e <- ggplot(sales_data, aes(x = City, fill = Category)) +
  geom_bar() +
  facet_wrap(~Category) +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title = "City Orders Segmented by Category")
print(p5e)