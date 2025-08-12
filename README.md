# Classic Models Sales Trend Analysis

## 📌 Overview
This project performs *Sales Trend Analysis* on the Classic Models database using *MySQL*.  
The objective is to analyze monthly revenue and order volume, along with additional insights such as growth trends, average order values, and top customers.

This analysis was completed as part of an internship task to demonstrate SQL skills in data aggregation and business trend reporting.

---

## 📂 Dataset
The dataset comes from the *Classic Models* sample database.  
Key tables used:
- *orders* — contains order dates and customer references.
- *orderdetails* — contains product quantity and price details.
- *customers* — customer details for revenue grouping.

---

## 📊 Steps Performed

### *1. Base Requirement*
- Extracted *monthly revenue* and *order volume*.
- Grouped results by year and month.
- Sorted in chronological order.

### *2. Additional Insights*
1. *Top 5 busiest months by revenue*
2. *Month-over-month revenue growth (%)*
3. *Average order value per month*
4. *Month-over-month order volume growth (%)*
5. *Top 5 customers by total revenue*

---

## 📌 Key Findings
- Revenue fluctuates significantly month to month.
- Some months show *high growth spikes*, likely due to seasonal or promotional sales.
- Average order value varies by month, suggesting possible changes in product mix or pricing.
- A small set of customers contribute to a large share of total revenue.

---

## 📄 Files in Repository
- sales_trend_analysis.sql — MySQL script with all queries.
- sales_trend_results.xlsx — Excel file with query outputs (each insight in a separate sheet).
- screenshot proof of results
- README.md — Project documentation.

---

## 🚀 How to Run
1. Import the *Classic Models* database into MySQL.
2. Open MySQL Workbench (or any SQL client).
3. Run the queries from sales_trend_analysis.sql.
4. Export results for reporting.

---

## 📌 Final Summary
The analysis highlights the importance of *month-wise trend monitoring* and *customer-level revenue tracking* for better business decisions.  
By using SQL aggregations and grouping, we can quickly generate actionable insights for sales strategy.
