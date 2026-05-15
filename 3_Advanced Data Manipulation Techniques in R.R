# ==============================================================================
# Subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 3: Advanced Data Manipulation Techniques in R (Recoding Variables)
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Remove the '#' on the line below to install the package for the first time
# install.packages("dplyr")

library(dplyr)

# --- Dataset Generation ---
set.seed(123)
sales_data <- data.frame(
  OrderID = 1:200,
  CustomerName = sample(c("Rahul", "Amit", "Priya","Neha","Arjun", "Sneha","Rohit", "Kiran"), 200, replace=TRUE),
  City = sample(c("Pune", "Mumbai","Delhi","Bangalore", "Hyderabad"), 200, replace=TRUE),
  Product = sample(c("Laptop","Mobile", "Tablet", "Shoes", "Watch"), 200, replace=TRUE),
  Category = sample(c("Electronics", "Fashion"), 200, replace=TRUE),
  Quantity = sample(1:10, 200, replace=TRUE),
  Price = sample(seq(500,50000,500), 200, replace=TRUE),
  Discount = sample(c(0,5,10,15,20), 200, replace=TRUE)
)
sales_data$Revenue <- sales_data$Quantity * sales_data$Price
sales_data$DiscountAmount <- sales_data$Revenue * (sales_data$Discount/100)
sales_data$FinalAmount <- sales_data$Revenue - sales_data$DiscountAmount

cat("\n--- Q1) Recoding Variables, Sorting and New Variable Creation ---\n")
sales_data$OrderSize <- ifelse(sales_data$Quantity >= 8, "Large", 
                               ifelse(sales_data$Quantity >= 4, "Medium", "Small"))
sales_data <- sales_data[order(-sales_data$Quantity), ] # Sort by Quantity desc
sales_data$Tax <- sales_data$FinalAmount * 0.18
sales_data$TotalBill <- sales_data$FinalAmount + sales_data$Tax
cat("Base R modifications complete.\n")

cat("\n--- Q2) Problems on dplyr select() and filter() ---\n")
q2a <- sales_data %>% select(CustomerName, Product)
q2d <- sales_data %>% filter(City == "Pune")
q2e <- sales_data %>% filter(Price > 20000 & Quantity > 5)
cat("Filtered Pune customers count:", nrow(q2d), "\n")

cat("\n--- Q3) Problems on Using mutate() and arrange() ---\n")
sales_data <- sales_data %>%
  mutate(
    Tax = FinalAmount * 0.18,
    Profit = FinalAmount * 0.20,
    OrderCategory = ifelse(FinalAmount > 50000, "High Value", "Standard")
  ) %>%
  arrange(desc(Revenue))
cat("Dplyr mutate and arrange operations complete.\n")

cat("\n--- Q4 & Q5) Grouping & Customer Analysis ---\n")
customer_summary <- sales_data %>%
  group_by(CustomerName) %>%
  summarise(
    OrderCount = n(),
    TotalRevenue = sum(Revenue),
    AvgOrderValue = mean(FinalAmount)
  ) %>%
  arrange(desc(TotalRevenue))

cat("Customer Summary (Top 3):\n"); print(head(customer_summary, 3))
cat("\nTop Customer is:", customer_summary$CustomerName[1], "\n")