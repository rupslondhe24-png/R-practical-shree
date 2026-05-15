# ==============================================================================
# subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 9: Introduction to S3 and S4 Classes
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# Load core R library for OOP classes
library(methods) 

# --- Dataset Generation ---
set.seed(789)
data <- data.frame(
  CustomerID = 1:5,
  Age = c(25, 34, 45, 23, 56),
  Income = c(50000, 65000, 80000, 42000, 95000),
  Membership = c("Gold", "Silver", "Platinum", "Gold", "Silver"),
  stringsAsFactors = FALSE
)

cat("\n--- Q1) Customer Object Modeling (S3 System) ---\n")
# 1 & 2. Create S3 Object
cust_s3 <- list(Name = "Customer A", Age = data$Age[1], Income = data$Income[1], Membership = data$Membership[1])
class(cust_s3) <- "Customer"

# 3. Custom print method
print.Customer <- function(obj) {
  cat("[S3 Customer] Name:", obj$Name, "| Age:", obj$Age, "| Income:", obj$Income, "| Level:", obj$Membership, "\n")
}

# 4 & 5. Display and Modify
print(cust_s3)
cust_s3$Income <- 60000 
cat("After modification:\n")
print(cust_s3)


cat("\n--- Q2) Advanced Customer Class (S4 System) ---\n")
# 1. Define S4 Class (Strict typing)
setClass("CustomerS4", slots = list(Age = "numeric", Income = "numeric", Membership = "character"))

# 2. Create Object
cust_s4 <- new("CustomerS4", Age = data$Age[2], Income = data$Income[2], Membership = data$Membership[2])

# 3. Write show method
setMethod("show", "CustomerS4", function(object) {
  cat("[S4 Customer] Age:", object@Age, "| Income:", object@Income, "| Member:", object@Membership, "\n")
})
show(cust_s4)


cat("\n--- Q3) Object Referencing and Copy Behavior ---\n")
data_copy <- data
data_copy$Age[1] <- 99 # Modify copy
cat("Original Age:", data$Age[1], "| Copy Age:", data_copy$Age[1], "\n") 
cat("Are original and copy identical? ", identical(data, data_copy), "\n") 


cat("\n--- Q4) Memory Optimization Study ---\n")
large_obj <- replicate(500, data, simplify = FALSE) 
cat("Size of large object:\n")
print(object.size(large_obj)) 
rm(large_obj) # Free memory
gc()          # Run Garbage Collection