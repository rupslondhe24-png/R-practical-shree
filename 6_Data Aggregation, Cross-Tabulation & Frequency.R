# ==============================================================================
# subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 6: Data Aggregation, Cross-Tabulation & Frequency
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Synthetic Dataset Generation ---
set.seed(42)
data <- data.frame(
  CustomerID = 1:100,
  Region = sample(c("North", "South", "East", "West"), 100, replace = TRUE),
  Gender = sample(c("Male", "Female"), 100, replace = TRUE),
  Purchase = sample(c("Yes", "No"), 100, replace = TRUE),
  Amount = sample(1000:8000, 100, replace = TRUE)
)

cat("\n--- Q1) Sales Performance Analysis ---\n")
q1a <- aggregate(Amount ~ Region, data = data, sum)
cat("a) Total sales by region:\n"); print(q1a)

q1b <- aggregate(Amount ~ Gender, data = data, mean)
cat("\nb) Average sales per gender:\n"); print(q1b)

q1c <- table(data$Purchase)
cat("\nc) Frequency distribution of purchase:\n"); print(q1c)

q1d <- table(data$Region, data$Purchase)
cat("\nd) Cross-tab: Region vs Purchase:\n"); print(q1d)

q1e <- chisq.test(q1d)
cat("\ne) Chi-square test (Region vs Purchase):\n"); print(q1e)


cat("\n--- Q2) Customer Segmentation ---\n")
q2a <- table(data$Region)
cat("a) Count customers by region:\n"); print(q2a)

q2b <- tapply(data$Amount, data$Region, mean)
cat("\nb) Average purchase by region (using tapply):\n"); print(q2b)

q2c <- table(data$Gender)
cat("\nc) Frequency of gender:\n"); print(q2c)

q2d <- table(data$Gender, data$Region)
cat("\nd) Cross-tab: Gender vs Region:\n"); print(q2d)

q2e <- chisq.test(q2d)
cat("\ne) Chi-square test (Gender vs Region):\n"); print(q2e)


cat("\n--- Q3) Purchase Pattern Analysis ---\n")
q3a <- sum(data$Amount)
cat("a) Total purchase amount: ", q3a, "\n")

# Row-wise sum using apply (summing the 'Amount' column)
q3b <- apply(data[, "Amount", drop=FALSE], 1, sum)
cat("\nb) Row-wise sum using apply (first 5 rows):\n"); print(head(q3b, 5))

q3d <- table(data$Purchase, data$Region)
cat("\nd) Cross-tab: Purchase vs Region:\n"); print(q3d)


cat("\n--- Q4) High-Value Customer Analysis ---\n")
high_value <- subset(data, Amount > 5000)
cat("a) Filtered customers with Amount > 5000. Count: ", nrow(high_value), "\n")

q4b <- mean(high_value$Amount)
cat("b) Mean purchase of filtered group: ", q4b, "\n")

q4d <- table(high_value$Gender, high_value$Purchase)
cat("\nd) Cross-tab: Gender vs Purchase (filtered):\n"); print(q4d)


cat("\n--- Q5) Business Decision Analysis ---\n")
q5b <- aggregate(Amount ~ Region, data = data, mean)
cat("b) Average revenue per region:\n"); print(q5b)

q5d <- table(data$Region, data$Purchase)
cat("\nd) Cross-tab: Region vs Purchase:\n"); print(q5d)