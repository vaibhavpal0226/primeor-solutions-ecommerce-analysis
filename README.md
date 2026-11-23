# 🛒 E-Commerce Data Cleaning & Validation Pipeline

## 📌 Project Overview
This project presents an end-to-end data cleaning, exploratory analysis, and visual dashboard implementation based on a raw e-commerce dataset comprising 51,271 transactional records. Built as part of the data analytics internship at Primeor Solutions, this project emphasizes data integrity, statistical accuracy, and professional documentation.

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
│   └── cleaned_dataset.xlsx  # Fully cleaned and validated 51k+ row dataset
└── README.md
```
---

## 🏗️ Technical Workflow

### Phase 1: Data Cleaning & Validation

* **Missing Value Imputation**
  * **`customer_name`**: Implemented relational lookup matching via `XLOOKUP` using `order_id` as a primary reference key.
  * **`profit`**: Imputed 14 profit missing values using the Median Profit grouped by Product `sub_category`. Median was chosen over average to avoid extreme financial outliers.

* **Text & Date Standardization**
  * **Whitespace & Noise Removal**: Applied `=PROPER(TRIM(CLEAN(...)))` to eliminate hidden non-printable characters, extra spacing, and inconsistent title casing across all categorical text columns.
  * **Date Correction**: Converted unstructured text-formatted dates into true, chronologically sortable serial dates using Excel's **Text to Columns** wizard (`YYYY-MM-DD` formatting).

* **Numerical Validation & Outlier Treatment**
  * **Anomaly Detection**: Audited financial and inventory columns, successfully identifying and removing a zero-sales transactional anomaly (`Sales = 0`, `Quantity = 1`).
  * **IQR Outlier Analysis**: Mapped upper and lower bounds using the $1.5 \times \text{IQR}$ rule (`QUARTILE.EXC`). Rather than blindly deleting high-ticket sales or profit extremes, evaluated them and **retained genuine business outliers** (e.g., bulk B2B wholesale orders).

* **Presentation & Formatting Polish**
  * Applied explicit currency formatting (`#,##0.00`) and standard integer formatting across all quantitative columns.
  * Ensured clean, uniform column headers for seamless ingestion into Power BI and SQL databases.

### Phase 2: Basic Excel Analysis & Pivot Charts

* Extracted Top 5 Revenue-Generating Products (dominated by high-ticket smartphones) and Top 5 Loss-Making Products (highlighting margin leakage from printers and heavy furniture).
* Built dynamic Pivot Tables and structured charts to evaluate regional contributions, category profitability, customer segment shares, and multi-year chronological trends.

---
