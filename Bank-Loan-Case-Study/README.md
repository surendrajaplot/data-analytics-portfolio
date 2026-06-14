# Bank Loan Risk Analytics

## Overview

This project analyzes customer loan application data to identify factors associated with repayment difficulties and loan default risk. The objective was to support data-driven lending decisions by uncovering patterns in customer demographics, financial characteristics, and historical loan behavior.

The analysis focuses on understanding credit risk drivers and providing actionable insights to improve loan approval processes and reduce financial losses.

---

## Business Problem

Banks and financial institutions must carefully evaluate loan applicants to balance business growth with credit risk. Approving high-risk customers can result in increased defaults, while overly restrictive lending policies can reduce profitability.

This project investigates customer loan applications and historical records to identify characteristics associated with repayment difficulties.

---

## Dataset Information

### Files Used

- application_data.csv
- previous_application.csv
- columns_description.csv

### Target Variable

**TARGET**

- 0 = Customer successfully repaid the loan
- 1 = Customer experienced payment difficulties

---

## Data Summary

| Metric | Value |
|----------|----------:|
| Total Applications | 49,999 |
| Non-Default Customers | 45,973 |
| Default Customers | 4,026 |
| Non-Default Rate | 91.95% |
| Default Rate | 8.05% |

The dataset exhibits a significant class imbalance, which is common in credit risk analysis.

---

## Methodology

### Data Cleaning

- Missing value treatment
- Data validation
- Duplicate checks
- Feature standardization

### Outlier Treatment

Outliers were identified using:

- Interquartile Range (IQR) Method
- Winsorization (1st and 99th Percentiles)

### Exploratory Data Analysis

- Univariate Analysis
- Bivariate Analysis
- Correlation Analysis
- Customer Segmentation
- Historical Application Analysis

---

## Key Findings

### Strongest Default Risk Indicators

| Variable | Correlation with Default Risk |
|----------|----------:|
| EXT_SOURCE_2 | -0.158 |
| EXT_SOURCE_3 | -0.158 |
| EXT_SOURCE_1 | -0.099 |
| AGE_YEARS | -0.077 |

These variables demonstrated the strongest relationship with repayment performance.

---

### Customer Financial Profile

| Metric | Value |
|----------|----------:|
| Average Income | 166,229 |
| Average Loan Amount | 596,989 |

Affordability was identified as a critical factor influencing repayment behavior.

---

### Previous Application Analysis

| Status | Percentage |
|----------|----------:|
| Approved | 63.8% |
| Refused | 17.3% |
| Cancelled | 17.2% |
| Unused Offer | 1.7% |

Historical customer behavior provided valuable information for risk assessment.

---

## Business Insights

- Strong external credit scores are associated with lower default risk.
- Employment stability improves repayment performance.
- Affordability ratios significantly influence credit risk.
- Previous loan behavior helps predict future repayment outcomes.
- Customer segmentation reveals different risk profiles.

---

## Recommendations

1. Integrate affordability metrics into loan approval processes.
2. Strengthen customer risk segmentation strategies.
3. Utilize historical application behavior in credit assessments.
4. Monitor high-risk customer groups more closely.
5. Develop predictive credit risk scoring models.

---

## Tools and Technologies

- Microsoft Excel
- Pivot Tables
- Statistical Analysis
- Data Cleaning
- Correlation Analysis
- Business Intelligence

---

## Skills Demonstrated

- Credit Risk Analytics
- Exploratory Data Analysis (EDA)
- Data Cleaning
- Missing Value Treatment
- Outlier Detection
- Correlation Analysis
- Financial Analytics
- Business Intelligence
- Decision Support Analytics

---

## Conclusion

This project demonstrates how data analytics can be used to improve credit risk assessment and support evidence-based lending decisions. By analyzing nearly 50,000 loan applications, key drivers of repayment difficulties were identified, providing valuable insights for reducing default risk and improving financial decision-making.
