# 🛒 E-Commerce Data Cleaning & Validation Pipeline

## 📌 Project Overview
This repository contains the rigorous data cleaning, missing value imputation, text standardization, and outlier analysis pipeline executed on a 51,271-row e-commerce transactional dataset. Built as part of the data analytics internship at Primeor Solutions, this project emphasizes data integrity, statistical accuracy, and professional documentation.

---

## 🛠️ Tech Stack & Tools
* **Spreadsheet Analysis:** Microsoft Excel (Advanced Formulas, Array Formulas, Pivot Tables)
* **Statistical Methods:** Interquartile Range (IQR) Analysis via `QUARTILE.EXC`
* **Data Engineering Standards:** Relational imputation, whitespace stripping, and datatype coercion

---

## 🔍 Key Data Cleaning & Processing Steps

### 1. Missing Value Imputation
* **`customer_name`**: Implemented relational lookup matching via `XLOOKUP` using `order_id` as a primary reference key.
* **`profit`**: Resolved missing entries by applying a conditional group median grouped by product `sub_category`, preserving the unique profit margin dynamics of different product tiers without distorting global distributions.

### 2. Text & Date Standardization
* **Whitespace & Noise Removal**: Applied `=TRIM(CLEAN(PROPER(...)))` to eliminate hidden non-printable characters, extra spacing, and inconsistent title casing across all categorical text columns.
* **Date Parsing**: Converted unstructured text-formatted dates into true, chronologically sortable serial dates using Excel's **Text to Columns** wizard (`YYYY-MM-DD` formatting).

### 3. Numerical Validation & Outlier Treatment
* **Anomaly Detection**: Audited financial and inventory columns, successfully identifying and removing a zero-sales transactional anomaly (`Sales = 0`, `Quantity = 1`).
* **IQR Outlier Analysis**: Mapped upper and lower fences using the $1.5 \times \text{IQR}$ rule (`QUARTILE.EXC`). Rather than blindly deleting high-ticket sales or profit extremes, evaluated them and **retained genuine business outliers** (e.g., bulk B2B wholesale orders) to preserve dataset variance for downstream exploratory analysis.

### 4. Presentation & Formatting Polish
* Applied explicit currency formatting (`$#,##0.00`) and standard integer formatting across all quantitative dimensions.
* Ensured clean, uniform column headers and structural gridline hygiene for seamless ingestion into Power BI and SQL databases.

---

## 📁 Repository Structure
```text
├── data/
│   └── cleaned_dataset.xlsx  # Fully cleaned and validated 51k+ row dataset
└── README.md
