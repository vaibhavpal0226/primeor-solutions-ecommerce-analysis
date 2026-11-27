# 🛒 E-Commerce Sales & Profitability Analytics Project

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
* **Dashboard** Power BI (Data Visualization)

---

## 📁 Repository Structure
```text
├── excel/
│   │── cleaned_dataset.xlsx         # Fully cleaned and validated 51k+ row dataset
│   └── excel_analysis_file.xlsx     # Workbook containing Pivot Tables and visual
├── sql/
│   └── sql_queries_file.sql         # Database, table schema & analytical SQL queries
├── dashboard/
│   └── power_bi_dashboard.pbix      # Interactive dashboard
├── images/
│   │── page_1.png
|   │── page_2.png       
│   └── page_3.png
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
* Migrate the cleaned 51,271-row e-commerce dataset from Excel/CSV into a structured MySQL relational database for SQL-based querying and validation.
* Formatted date columns (order_date, ship_date) into YYYY-MM-DD format, stripped currency symbols and thousand-separator commas from numeric fields, and exported the cleaned Excel sheet as a CSV file.
* Created primeor_ecommerce database and designed the orders table with an auto-incrementing primary key (id) and explicit data types (DATE, VARCHAR, INT, DECIMAL)
* Loaded the CSV into MySQL using LOAD DATA INFILE via the secure uploads directory (secure_file_priv) for speed optimization and specified CHARACTER SET latin1 to avoid string errors.

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
* Summarized top revenue markets, loss-making categories/sub-categories, shipping mode distribution, discount-driven loss orders, and high-spend customer margin anomalies.

### Level 3: Power BI Interactive Dashboard

* Connected the cleaned 51,271-row e-commerce dataset to Power BI Desktop and created core DAX measures (`Total Sales`, `Total Profit`, `Total Orders`, and `Average Discount`) to keep metrics consistent across all pages.
* **Page 1 — Executive Overview:** Built a left navigation sidebar, project overview summary, interactive slicers, and four KPI cards displaying **Total Sales**, **Total Profit**, **Total Orders**, and **Average Discount**
* **Page 2 — Sales Analysis:** Created visuals for **Sales by Region**, **Sales by Market**, **Monthly Sales Trend**, and **Category Performance** to highlight regional leaders, global market share, year-end seasonality, and category profitability.
* **Page 3 — Product & Customer Insights:** Built visuals for **Top Products**, **Top Customers**, **Profit by Sub-Category**, and **Segment Analysis** across *Consumer*, *Corporate*, and *Home Office*.

---

## 💡 Key Business Insights
* **Markets & Regions:** **APAC** leads revenue (**₹35,81,785.00**, **12.20%** margin), **Canada** achieves the highest profit margin (**26.56%**), and **EMEA** has a thin **5.44%** margin. **Central** is the top region (**₹28,21,740.00** / **22.33%** share).
* **Categories & Sub-Categories:** **Technology** leads profit (**₹6,63,336.35**) and per-item profit (**₹65.44**), while **Furniture** has the lowest category profit (**₹2,86,165.20**) and highest average discount (**16.80%**, up to **85%**). **Copiers** and **Phones** lead sub-category returns, whereas **Tables** is the only loss-making sub-category (**-₹64,113.61** profit / **-8.48%** margin).
* **Customers & Discount Leakage:** **Consumer** leads segment share (**51.47%**), followed by **Corporate** (**30.26%**) and **Home Office** (**18.27%**). Steep discounts (`35%–85%`) drive heavy order losses (e.g., order `CA-2013-108196` at **-₹6,892.37**) and even turn high-revenue buyers like *Sean Miller* (**₹33,194.00** sales) into a net loss (**-₹842.63**).
* **Growth, Seasonality & Shipping:** Annual sales nearly doubled from **₹22,59,569.00** (2011) to **₹42,93,920.00** (2014), with consistent **November–December** peaks. **Standard Class** is the most used shipping mode (**59.57%** share, **₹19.97** avg shipping cost) compared to **Same Day** (**5.30%** share, **₹42.96** avg shipping cost).

---
