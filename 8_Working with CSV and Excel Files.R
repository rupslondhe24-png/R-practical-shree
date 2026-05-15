# ==============================================================================
# subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 8: Working with CSV and Excel Files (Using dplyr)
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Remove the '#' on the line below to install the package for the first time
# install.packages("dplyr")

# Load required library
library(dplyr)

# --- Synthetic Data Generation for Multiple Contexts ---
set.seed(456)
sales <- data.frame(
  ProductID = 101:120,
  Category = sample(c("Electronics", "Clothing", "Home"), 20, replace = TRUE),
  Price = runif(20, 10, 500),
  Quantity = sample(10:100, 20, replace = TRUE)
) %>% mutate(Revenue = Price * Quantity)

customers <- data.frame(
  CustomerID = 1:50,
  Gender = sample(c("Male", "Female"), 50, replace = TRUE),
  Age = sample(18:80, 50, replace = TRUE),
  PurchaseAmount = runif(50, 100, 5000)
)

transactions <- data.frame(
  TransactionID = 1:30,
  Type = sample(c("Deposit", "Withdrawal"), 30, replace = TRUE),
  Amount = runif(30, 500, 20000)
)

cat("\n--- Q1) Retail Sales Analysis ---\n")
cat("b) Total Revenue by Product (Top 5):\n")
q1b <- sales %>% group_by(ProductID) %>% summarise(TotalRev = sum(Revenue))
print(head(q1b, 5))

cat("\nc) Top 5 products with highest revenue:\n")
print(sales %>% arrange(desc(Revenue)) %>% head(5))


cat("\n--- Q2) E-Commerce Customer Analysis ---\n")
avg_pur <- mean(customers$PurchaseAmount)
cat("b) Average purchase amount: ₹", round(avg_pur, 2), "\n")

cat("d) Number of male and female customers:\n")
print(table(customers$Gender))

# e) Create age groups
customers$AgeGroup <- cut(customers$Age, breaks=c(0, 25, 50, Inf), labels=c("Youth", "Adult", "Senior"))
cat("\nf) Top 3 highest spending customers:\n")
print(customers %>% arrange(desc(PurchaseAmount)) %>% head(3))


cat("\n--- Q3) Banking Transaction Analysis ---\n")
cat("b) Total Deposits: ₹", sum(transactions$Amount[transactions$Type == "Deposit"]), "\n")
cat("c) Total Withdrawals: ₹", sum(transactions$Amount[transactions$Type == "Withdrawal"]), "\n")
cat("e) Average transaction amount: ₹", mean(transactions$Amount), "\n")

cat("\nf) Number of transactions by type:\n")
print(table(transactions$Type))