# 🛒 E-Commerce Data Cleaning & Validation Pipeline

## 📌 Project Overview
This repository contains the rigorous data cleaning, missing value imputation, text standardization, and outlier analysis pipeline executed on a 51,271-row e-commerce transactional dataset. Built as part of the data analytics internship at Primeor Solutions, this project emphasizes data integrity, statistical accuracy, and professional documentation.

---

## 🛠️ Tech Stack & Tools
* **Spreadsheet Analysis:** Microsoft Excel (Advanced Formulas, Array Formulas, XLOOKUP)
* **Statistical Methods:** Interquartile Range (IQR) Analysis via `QUARTILE.EXC`

---

## 🔍 Key Data Cleaning & Processing Steps

### 1. Missing Value Imputation
* **`customer_name`**: Implemented relational lookup matching via `XLOOKUP` using `order_id` as a primary reference key.
* **`profit`**: Imputed 14 profit missing values using the Median Profit grouped by Product `sub_category`. Median was chosen over average to avoid extreme financial outliers.

### 2. Text & Date Standardization
* **Whitespace & Noise Removal**: Applied `=PROPER(TRIM(CLEAN(...)))` to eliminate hidden non-printable characters, extra spacing, and inconsistent title casing across all categorical text columns.
* **Date Correction**: Converted unstructured text-formatted dates into true, chronologically sortable serial dates using Excel's **Text to Columns** wizard (`YYYY-MM-DD` formatting).

### 3. Numerical Validation & Outlier Treatment
* **Anomaly Detection**: Audited financial and inventory columns, successfully identifying and removing a zero-sales transactional anomaly (`Sales = 0`, `Quantity = 1`).
* **IQR Outlier Analysis**: Mapped upper and lower bounds using the $1.5 \times \text{IQR}$ rule (`QUARTILE.EXC`). Rather than blindly deleting high-ticket sales or profit extremes, evaluated them and **retained genuine business outliers** (e.g., bulk B2B wholesale orders).

### 4. Presentation & Formatting Polish
* Applied explicit currency formatting (`#,##0.00`) and standard integer formatting across all quantitative columns.
* Ensured clean, uniform column headers for seamless ingestion into Power BI and SQL databases.

---

## 📁 Repository Structure
```text
├── excel/
│   └── cleaned_dataset.xlsx  # Fully cleaned and validated 51k+ row dataset
└── README.md
