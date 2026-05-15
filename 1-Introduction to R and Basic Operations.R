# ==============================================================================
# subject: Data Analysis with R Programming (DTS-162-PR)
# Assignment 1: Introduction to R and Basic Operations
# Author: Sandesh Pramod Dixit | Roll No: 24
# ==============================================================================

cat("\n--- Q1) Arithmetic Operations ---\n")
# Using predefined values to simulate user input for the script
num1 <- 15
num2 <- 4

results <- c(
  Addition = num1 + num2,
  Subtraction = num1 - num2,
  Multiplication = num1 * num2,
  Division = num1 / num2,
  Power = num1 ^ num2,
  Modulus = num1 %% num2
)

print(results)
cat("Maximum:", max(results), "\n")
cat("Minimum:", min(results), "\n")
cat("Average:", mean(results), "\n")

cat("\n--- Q2) Random Numbers and Math Functions ---\n")
set.seed(123)
random_nums <- sample(1:100, 10, replace = TRUE)
sqrt_vals <- sqrt(random_nums)

q2_df <- data.frame(
  Original = random_nums,
  SquareRoot = sqrt_vals,
  Rounded = round(sqrt_vals, 2),
  Ceiling = ceiling(sqrt_vals),
  Floor = floor(sqrt_vals)
)
print(q2_df)

cat("\n--- Q3) String Manipulation ---\n")
names_list <- c("Sandesh", "Amit", "Priya", "Rahul")
upper_names <- toupper(names_list)
char_counts <- nchar(names_list)

sentences <- paste("The name", upper_names, "has", char_counts, "characters.")
print(sentences)

cat("\n--- Q4) Number Filtering (1 to 200) ---\n")
nums <- 1:200
filtered_nums <- nums[nums %% 3 == 0 & nums %% 5 == 0]

q4_df <- data.frame(
  Number = filtered_nums,
  Square = filtered_nums^2,
  SquareRoot = round(sqrt(filtered_nums), 2)
)
print(head(q4_df)) # Displaying first few for brevity

cat("\n--- Q5) Quadratic Equation Roots ---\n")
a <- 1; b <- -5; c <- 6 # Example: x^2 - 5x + 6 = 0
discriminant <- (b^2) - (4 * a * c)

if (discriminant > 0) {
  root1 <- (-b + sqrt(discriminant)) / (2 * a)
  root2 <- (-b - sqrt(discriminant)) / (2 * a)
  cat("Roots are real and distinct:", root1, "and", root2, "\n")
} else if (discriminant == 0) {
  root <- -b / (2 * a)
  cat("Roots are real and equal:", root, "\n")
} else {
  cat("Roots are complex.\n")
}