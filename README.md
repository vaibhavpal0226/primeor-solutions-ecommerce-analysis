# 🛒 E-Commerce Data Cleaning & Validation Pipeline

## 📌 Project Overview
This project documents an end-to-end data analytics workflow on a **51,271-row e-commerce transaction dataset** (covering order dates, shipping details, customers, segments, locations, product categories, sales, quantity, discount, profit, and shipping cost). The work spans data cleaning and Excel analysis (Level 1), MySQL database migration and analytical querying (Level 2), and interactive dashboarding in Power BI (Level 3). Built as part of the data analytics internship at Primeor Solutions.

---

![Microsoft Excel](https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white)
![SQL](https://img.shields.io/badge/MySQL-00000F?style=for-the-badge&logo=mysql&logoColor=white)
![Power_BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)

---

## 📈 Key Performance Indicators (KPI Summary)
* Total Sales (Revenue): ₹1,26,35,222.00
* Total Net Profit: ₹14,67,722.99
* Average Discount Rate: 14.29%
* Overall Profit Margin: ~11.61%

---

## 🛠️ Tech Stack & Tools
* **Spreadsheet Analysis:** Microsoft Excel (Advanced Formulas, Array Formulas, XLOOKUP)
* **Statistical Methods:** Interquartile Range (IQR) Analysis via `QUARTILE.EXC`
* **Database** MySQL (GROUP BY, HAVING, Window Functions)

---

## 📁 Repository Structure
```text
├── excel/
│   │── cleaned_dataset.xlsx         # Fully cleaned and validated 51k+ row dataset
│   └── excel_analysis_file.xlsx     # Workbook containing Pivot Tables and visual
├── sql/
│   ├── sql_queries_file.sql         # Database, table schema & analytical SQL queries
└── README.md
```
---

## 🏗️ Project Workflow

### Level 1: Data Cleaning, Excel Analysis & Pivot Reporting

* **Data Cleaning & Validation:** Audited all 51,271 rows, resolved hidden whitespace and text-casing inconsistencies, handled missing values, converted dates to standard formats, and evaluated outliers using the $1.5 \times \text{IQR}$ rule while retaining legitimate high-value transactions.
* **Core Metrics & Rankings:** Computed baseline KPIs and identified top revenue-generating and loss-making products.
* **Pivot Tables & Charts:** Analyzed regional sales, category profit, customer segment shares, and yearly/monthly sales trends.

### Level 2: MySQL Migration, Queries & Analytical Insights

#### Task 1: Import Cleaned Dataset into SQL
* Formatted date columns (`order_date`, `ship_date`) as `YYYY-MM-DD`, stripped currency symbols and commas from numeric columns, and exported the cleaned data as a CSV.
* Created the `primeor_ecommerce` database and `orders` table with an auto-incrementing primary key (`id`) and explicit data types (`DATE`, `VARCHAR`, `INT`, `DECIMAL`) across all 21 columns.
* Loaded the CSV using `LOAD DATA INFILE` from MySQL's secure upload directory with `CHARACTER SET latin1` to resolve accented character encoding (`\xE1n`) in state names.
* Verified row count (`51,271`) and reconciled core totals (`Sales`, `Profit`, `Avg Discount`) against Excel.

#### Task 2: SQL Queries Executed
* Executed SQL queries for:
  * Top 10 profitable products
  * Top 10 customers by sales
  * Region-wise total sales
  * Category-wise average profit
  * Highest discount category
  * Orders with negative profit
  * Monthly sales trend
  * Market-wise revenue analysis
  * Top-performing sub-categories
  * Ship mode usage analysis

#### Task 3: Key SQL Insights
* **Highest-Revenue Market:** APAC generates the highest revenue of more than 35 lakhs (across 5400+ orders) with 4 lakh+ in profit (which is  12.20% profit margin). Meanwhile Canada has lowest revenue of nearly 67 thousand but has highest profit margin (26.56%) amongs all market and EMEA has the lowest profit margin (5.44%).
* **Least Profitable Categories:** Amongs main categories Furniture brings the lowest profit of nearly 2.90 lakhs which is less than half of Technology category and carries the highest average discount (16.80%, reaching upto 85%). At the sub-category level, Table is only loss-maker, lossing 64 thousand (-8.48% margin) on 7.50 lakhs+ sales.
* **Most Commonly Used Shipping Mode:** Standard class shipping is most commonly used shipping mode, accounting for 59.57% usage, 75 lakhs+ in sales and nearly 8.90 lakhs in profit. It also has the lowest average shipping cost (~ 20), whereas Same Day is the least used (5.30% usage) with the highest average shipping cost (~ 43).

### Level 3: Power BI Dashboard *(In Progress)*
* Interactive executive dashboard covering KPI cards, regional/market performance, category & sub-category margins, discount vs. profit analysis, and sales trends.
---
