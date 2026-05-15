# ==============================================================================
# subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 10: Complete Data Analysis - Final Project
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Remove the '#' on the lines below to install the packages for the first time
# install.packages("ggplot2")
# install.packages("dplyr")

# Load required libraries
library(ggplot2)
library(dplyr)

cat("\n--- Task 1 & 2: Data Import & Preprocessing ---\n")
# Generating synthetic data to simulate a downloaded Kaggle Customer Dataset
set.seed(123)
n <- 200
customer_data <- data.frame(
  CustomerID = 1:n,
  Gender = sample(c("Male", "Female"), n, replace = TRUE),
  Age = sample(18:70, n, replace = TRUE),
  Annual_Income = rnorm(n, mean = 60000, sd = 15000),
  Spending_Score = sample(1:100, n, replace = TRUE),
  Region = sample(c("North", "South", "East", "West"), n, replace = TRUE)
)

# Preprocessing: Factoring categorical variables and dropping IDs
customer_data$Gender <- as.factor(customer_data$Gender)
customer_data$Region <- as.factor(customer_data$Region)
clean_data <- customer_data %>% select(-CustomerID)

cat("Missing Values Found: ", sum(is.na(clean_data)), "\n")
cat("\nStatistical Summary of Cleaned Data:\n")
print(summary(clean_data))


cat("\n--- Task 3 & 4: Analytical Methods & Hypothesis Testing ---\n")
# Correlation Assessment
cor_val <- cor(clean_data$Annual_Income, clean_data$Spending_Score)
cat(sprintf("Pearson Correlation (Income vs Spending): %.4f\n", cor_val))

# Hypothesis Testing: Is the average income significantly different from 55,000?
t_test_result <- t.test(clean_data$Annual_Income, mu = 55000)
print(t_test_result)


cat("\n--- Task 6: Data Visualization (EDA) ---\n")

# Plot 1: Age Distribution
p1 <- ggplot(clean_data, aes(x = Age)) +
  geom_histogram(binwidth = 5, fill = "navy", color = "white", alpha = 0.8) +
  theme_minimal() +
  labs(title = "EDA: Age Distribution of Customers", x = "Age", y = "Frequency")
print(p1)

# Plot 2: Spending Score by Gender
p2 <- ggplot(clean_data, aes(x = Gender, y = Spending_Score, fill = Gender)) +
  geom_boxplot() +
  theme_minimal() +
  labs(title = "Spending Score Distribution by Gender", y = "Spending Score")
print(p2)

# Plot 3: Income vs Spending Score
p3 <- ggplot(clean_data, aes(x = Annual_Income, y = Spending_Score, color = Region)) +
  geom_point(alpha = 0.7, size = 3) +
  geom_smooth(method = "lm", color = "black", se = FALSE) +
  theme_minimal() +
  labs(title = "Annual Income vs. Spending Score", x = "Annual Income (₹)", y = "Spending Score")
print(p3)

cat("\n--- Task 7: Final Conclusion ---\n")
cat("Conclusion: The analysis reveals the distribution of customer ages and regional spending habits.\n")
cat("The correlation test indicates the exact strength of the relationship between income and spending.\n")
cat("Furthermore, the t-test confirms whether the sample income significantly deviates from the hypothesized ₹55,000 benchmark.\n")