# ==============================================================================
# Subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 4: Data Management and Manipulation in R
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Fixed: Added missing closing quote for "writexl"
if(!require(readxl)) install.packages("readxl")
if(!require(writexl)) install.packages("writexl")

library(readxl)
library(writexl)

# --- Generating Mock Files ---
set.seed(123)
mock_data <- data.frame(
  CustomerName = c("Rahul", "Amit", "Priya", "Neha", "Arjun"),
  City = c("Pune", "Mumbai", "Delhi", "Pune", "Hyderabad"),
  Category = c("Electronics", "Fashion", "Electronics", "Home", "Fashion"),
  Product = c("Laptop", "Shoes", "Tablet", "Lamp", "Watch"),
  Quantity = c(2, 6, 1, 10, 5),
  Price = c(45000, 2000, 15000, 800, 5000),
  FinalAmount = c(90000, 12000, 15000, 8000, 25000)
)
write.csv(mock_data, "sales_data.csv", row.names = FALSE)
write_xlsx(mock_data, "sales_data.xlsx")

# --- Q1) Importing and Exploring Data ---
cat("\n--- Q1) Importing and Exploring Data ---\n")
sales_data_csv <- read.csv("sales_data.csv")
sales_data_excel <- read_excel("sales_data.xlsx")

cat("Structure of CSV Data:\n")
str(sales_data_csv)
cat("\nSummary of Excel Data:\n")
print(summary(sales_data_excel))

# --- Q3) Modifying Data and Subset Creation ---
cat("\n--- Q3) Modifying Data and Subset Creation ---\n")
# Create Profit column (Assuming 20% margin)
sales_data_csv$Profit <- sales_data_csv$FinalAmount * 0.20

# Rename FinalAmount column
names(sales_data_csv)[names(sales_data_csv) == "FinalAmount"] <- "TotalBill"

# Add Tax column
sales_data_csv$Tax <- sales_data_csv$TotalBill * 0.18

# Subset orders with Quantity > 5
high_qty_orders <- subset(sales_data_csv, Quantity > 5)
cat("Orders with Quantity > 5:\n")
print(high_qty_orders)

# --- Q4) Column Selection ---
cat("\n--- Q4) Column Selection ---\n")
cat("1. CustomerName and Product columns:\n")
print(sales_data_csv[, c("CustomerName", "Product")])

# Added: 2. Excluding the Tax column (example of excluding by name)
cat("\n2. Data excluding Tax column:\n")
print(sales_data_csv[, !names(sales_data_csv) %in% c("Tax")])

cat("\n3. Numeric columns only:\n")
numeric_cols <- sales_data_csv[, sapply(sales_data_csv, is.numeric)]
print(numeric_cols)

# --- Q5) Sorting Data & Aggregation ---
cat("\n--- Q5) Sorting Data & Aggregation ---\n")
sorted_city <- sales_data_csv[order(sales_data_csv$City), ]
cat("1. Sorted alphabetically by City:\n")
print(sorted_city[, c("CustomerName", "City")])

# Added: 2. Sorting by Price descending
cat("\n2. Sorted by Price (High to Low):\n")
print(sales_data_csv[order(-sales_data_csv$Price), ])

cat("\n3. Average price by city:\n")
print(aggregate(Price ~ City, data = sales_data_csv, FUN = mean))

# Added: 4. Count of products per category
cat("\n4. Count of products by Category:\n")
print(table(sales_data_csv$Category))

cat("\n5. Total quantity sold by city:\n")
print(aggregate(Quantity ~ City, data = sales_data_csv, FUN = sum))

# --- Q2) Exporting Data ---
cat("\n--- Q2) Exporting Data ---\n")
write.csv(sales_data_csv, "modified_sales_data.csv", row.names = FALSE)
write_xlsx(sales_data_csv, "modified_sales_data.xlsx")

electronics_data <- subset(sales_data_csv, Category == "Electronics")
write.csv(electronics_data, "electronics_sales.csv", row.names = FALSE)

cat("Files 'modified_sales_data.csv' and 'electronics_sales.csv' created successfully.\n")