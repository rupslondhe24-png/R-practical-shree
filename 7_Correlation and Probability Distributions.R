# ==============================================================================
# Course: Data Analysis with R Programming (DTS-162-PR)
# Assignment 7: Correlation and Probability Distributions
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

# --- Package Installation ---
# Remove the '#' on the line below to install the package for the first time
# install.packages("ggplot2")

# Load required library
library(ggplot2)

# --- Synthetic Dataset Generation ---
set.seed(123)
n <- 100
data <- data.frame(
  Income = rnorm(n, mean = 52000, sd = 12000),
  SpendingScore = sample(1:100, n, replace = TRUE),
  Age = sample(18:70, n, replace = TRUE),
  Region = sample(c("North", "South", "East", "West"), n, replace = TRUE),
  Purchase = sample(c(0, 1), n, replace = TRUE, prob = c(0.4, 0.6))
)

cat("\n--- Q1) Retail Income vs Spending Strategy ---\n")
# 1 & 2. Pearson Correlation and Significance
cor_q1 <- cor.test(data$Income, data$SpendingScore, method = "pearson")
cat("Pearson Correlation (Income vs Spending Score):\n")
print(cor_q1)

# 4. One-sample t-test (Income = 50,000)
cat("\nOne-sample t-test (H0: mean income = 50,000):\n")
print(t.test(data$Income, mu = 50000))

cat("\n--- Q2) Customer Segmentation Strategy ---\n")
# 1. Correlation Matrix
cat("Correlation Matrix (Age, Income, SpendingScore):\n")
print(cor(data[, c("Age", "Income", "SpendingScore")]))

# 5. Kruskal-Wallis (SpendingScore vs Region)
cat("\nKruskal-Wallis Test (SpendingScore by Region):\n")
print(kruskal.test(SpendingScore ~ Region, data = data))

cat("\n--- Q4) Product Demand Forecasting ---\n")
# 1. Spearman Correlation (Age/Income)
cat("Spearman Correlation (Age vs Income):\n")
print(cor.test(data$Age, data$Income, method = "spearman"))

# 5. Chi-square (Region distribution)
cat("\nChi-square Goodness-of-Fit for Regions:\n")
print(chisq.test(table(data$Region)))

cat("\n--- Q5) Customer Satisfaction Modeling ---\n")
# Wilcoxon Test
cat("Wilcoxon Test (Age vs SpendingScore):\n")
print(wilcox.test(data$Age, data$SpendingScore))

cat("\n--- Q7) Strategic Business Decision Model ---\n")
# 3. Poisson Distribution (Simulated Demand)
cat("Simulated Poisson Demand (First 10 values, lambda = 10):\n")
print(head(rpois(100, lambda = 10), 10))