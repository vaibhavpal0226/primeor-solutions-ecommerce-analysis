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

---

## 📁 Repository Structure
```text
├── excel/
│   │── cleaned_dataset.xlsx         # Fully cleaned and validated 51k+ row dataset
│   └── excel_analysis_file.xlsx     # Workbook containing Pivot Tables and visual
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
1. Top 10 profitable products
2. Top 10 customers by sales
3. Region-wise total sales
4. Category-wise average profit
5. Highest discount category
6. Orders with negative profit
7. Monthly sales trend
8. Market-wise revenue analysis
9. Top-performing sub-categories
10. Ship mode usage analysis

#### Task 3: Key SQL Insights
* **Highest-Revenue Market:** **APAC** leads in revenue (**35,81,785.00** across 5,436 orders) and profit (**4,37,023.46**)[cite: 13]. **Canada** posts the highest profit margin (**26.56%**) on smaller volume (**66,932.00**), while **EMEA** shows a thin **5.44%** margin[cite: 13].
* **Least Profitable Categories:** **Furniture** generates the lowest category profit (**2,86,165.04**) alongside the highest average discount (**16.80%**, peak **85.00%**)[cite: 10]. At the sub-category level, **Tables** is the only loss-making sub-category (**-64,113.61** profit / **-8.48%** margin on **756,031.00** sales)[cite: 14].
* **Most Commonly Used Shipping Mode:** **Standard Class** is the primary shipping mode (**59.57%** usage share, **75,74,395.00** sales, **8,89,476.70** profit) and has the lowest average shipping cost (**19.97**), whereas **Same Day** has the lowest share (**5.30%**) and highest average shipping cost (**42.96**)[cite: 15].
* **Top Products, Customers & Loss Drivers:** *Canon imageCLASS 2200 Advanced Copier* leads product profit (**25,199.94** on **61,600.00** sales)[cite: 6]. Among top-10 revenue customers, *Tom Ashbrook* leads sales (**40,417.00**), while *Sean Miller* ranks 5th in sales (**33,194.00**) with a net loss of **-842.63**[cite: 7]. Heavy discounting (often **50%–85%**) drives major negative-profit orders such as `CA-2013-108196` (**-6,892.37** loss at **53.33%** avg discount)[cite: 11].
* **Regional & Seasonal Patterns:** **Central** leads all regions in sales (**28,21,740.00** / **22.33%** share)[cite: 8], and monthly order volume and revenue climb strongly toward year-end[cite: 12].

---
