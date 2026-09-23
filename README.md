# Healthcare Claims Analysis

## Project Overview

This project analyzes a synthetic healthcare claims dataset using **MySQL and Microsoft Excel**.

The goal was to examine claim volume, allowed amounts, paid amounts, payment rates, and differences between allowed and paid amounts across different healthcare categories.

## Tools Used

- MySQL
- Microsoft Excel
- SQL
- PivotTables
- PivotCharts

## Dataset

The dataset contains **25 synthetic healthcare claims**.

The data includes fields such as:

- Beneficiary ID
- Provider NPI
- Date of Service
- HCPCS Code
- Diagnosis Code
- Place of Service
- Specialty
- State
- Allowed Amount
- Paid Amount

No real patient or protected health information is used.

## SQL Analysis

Using MySQL, I analyzed the claims data by:

- Calculating total allowed and paid amounts
- Calculating payment rates
- Calculating allowed-paid payment differences
- Analyzing claims by specialty
- Analyzing claims by state
- Analyzing claims by HCPCS code
- Analyzing monthly claim activity
- Identifying the top 5 claims by allowed amount
- Filtering claims using `WHERE`, `AND`, `OR`, and `BETWEEN`
- Categorizing claims using `CASE`
- Converting text-based dates using MySQL date functions
- Cleaning dollar amounts using `REPLACE()` and `CAST()`

## Excel Analysis

In Excel, I created:

- PivotTables by specialty, state, HCPCS code, and month
- Claims by Specialty chart
- Allowed vs. Paid Amount by Specialty chart
- Claims by State chart
- Claims by HCPCS Code chart
- Payment percentage calculations

## Key Results

- Total claims analyzed: **25**
- Total allowed amount: **$1,791.09**
- Total paid amount: **$1,442.00**
- Overall payment rate: **80.51%**
- Overall allowed-paid difference: **$349.09**

## Project Files

- `Healthcare_Claims_Analysis.sql` — SQL queries used for analysis
- `healthcare_data.xlsx` — Excel analysis with PivotTables and charts
- `Healthcare_data.csv` — dataset used for the analysis

## Note

This is a **portfolio project using synthetic healthcare claims data** created for learning and demonstration purposes. It does not represent real patient or insurance claim records.
