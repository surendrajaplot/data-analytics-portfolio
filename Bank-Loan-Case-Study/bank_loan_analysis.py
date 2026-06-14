import pandas as pd

# Load dataset
df = pd.read_csv("application_data.csv")

# Default rate
default_rate = df["TARGET"].mean() * 100

print(f"Default Rate: {default_rate:.2f}%")

# Average Income
print("Average Income:", df["AMT_INCOME_TOTAL"].mean())

# Average Credit Amount
print("Average Credit:", df["AMT_CREDIT"].mean())

# Correlation with TARGET
correlations = df.corr(numeric_only=True)["TARGET"].sort_values()

print(correlations.tail(10))
