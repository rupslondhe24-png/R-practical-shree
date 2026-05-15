# ==============================================================================
# Course: Data Analysis with R Programming (DTS-162-PR)
# Assignment 2: Data Structures and Control Structures in R
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Dataset Generation ---
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:100,
  CustomerName = sample(c("Rahul", "Amit", "Priya","Neha","Arjun","Sneha","Rohit", "Kiran"), 100, replace=TRUE),
  City = sample(c("Pune", "Mumbai","Delhi","Bangalore", "Hyderabad"), 100, replace=TRUE),
  Product = sample(c("Laptop","Mobile", "Tablet", "Shoes", "Watch"), 100,replace=TRUE),
  Category = sample(c("Electronics", "Fashion"), 100, replace=TRUE),
  Quantity = sample(1:10,100,replace=TRUE),
  Price = sample(seq(500,50000,500), 100, replace=TRUE),
  Discount = sample(c(0,5,10,15,20), 100, replace=TRUE),
  PaymentMethod = sample(c("Cash", "Card", "UPI"), 100, replace=TRUE)
)
sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * (sales_data$Discount / 100)
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

cat("\n--- Q1) Filtering Rows ---\n")
cat("1. Orders where Price > 20000 (Count):", nrow(sales_data[sales_data$Price > 20000, ]), "\n")
cat("2. Orders where City = Pune (Count):", nrow(sales_data[sales_data$City == "Pune", ]), "\n")
cat("3. Orders where Quantity > 5 (Count):", nrow(sales_data[sales_data$Quantity > 5, ]), "\n")

cat("\n--- Q2) Sorting Data ---\n")
sorted_by_price <- sales_data[order(sales_data$Price), ]
sorted_multi <- sales_data[order(sales_data$City, -sales_data$Revenue), ]
cat("Sorting completed successfully.\n")

cat("\n--- Q3) Aggregation ---\n")
cat("1. Total revenue by city:\n"); print(aggregate(Revenue ~ City, sales_data, sum))
cat("\n2. Average price by category:\n"); print(aggregate(Price ~ Category, sales_data, mean))

cat("\n--- Q4) Conditional Statements ---\n")
sales_data$DiscountLabel <- ifelse(sales_data$Discount > 10, "High Discount", "Low/Normal Discount")
sales_data$ValueCategory <- ifelse(sales_data$FinalAmount > 50000, "High", 
                                   ifelse(sales_data$FinalAmount > 20000, "Medium", "Low"))
cat("Added 'DiscountLabel' and 'ValueCategory' columns.\n")

# Cumulative revenue via while loop
i <- 1; cumulative_rev <- 0
while(i <= nrow(sales_data)) {
  cumulative_rev <- cumulative_rev + sales_data$Revenue[i]
  i <- i + 1
}
cat("\nCumulative Revenue calculated via while loop:", cumulative_rev, "\n")

cat("\n--- Q5 & Q6) Advanced Analysis ---\n")
cat("Average discount:", mean(sales_data$Discount), "%\n")
cat("Total discount amount given: ₹", sum(sales_data$DiscountAmount), "\n")