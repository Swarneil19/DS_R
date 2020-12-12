df = read.csv("Data.csv")
df

#Missing values

df$Age = ifelse(
  is.na(df$Age),
  ave(df$Age, FUN = function(x) mean(x , na.rm = TRUE)),
  df$Age
)

df$Salary = ifelse(
  is.na(df$Salary),
  ave(df$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
  df$Salary
)
df
# Encoding Categorical data

df$Country = factor(
  df$Country,
  levels = c('France', 'Spain', 'Germany'),
  labels = c(1,2,3)
) 

df$Purchased = factor(
  df$Purchased,
  levels = c('Yes','No'),
  labels = c(1,2)
)

# Spliting datasets into training sets and test sets
 
set.seed(123)
split = sample.split(df$Purchased, SplitRatio = 0.8)
training_set = subset(df, split == TRUE)
test_set = subset(df, split == FALSE)


#Feature scaling

training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])






