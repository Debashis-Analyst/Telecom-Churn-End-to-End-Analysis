
---

## 📌 Project Overview







# 📊 Telecom Customer Churn Analysis

### End-to-End Data Analysis  Python · SQL · Power BI

---

## 📌 Project Overview

Customer churn is one of the most critical challenges for subscription-based telecom businesses — acquiring a new customer costs significantly more than retaining an existing one. This project analyzes the **IBM Telco Customer Churn dataset** to identify the key drivers behind customer churn and translate those findings into actionable business recommendations.

The analysis goes beyond surface-level averages — for example, high churn among Internet Provider (Fiber Optic) customers is investigated further and shown to be driven specifically by the **absence of Tech Support**, not the service itself. Similar segment-level investigation was applied across contract type, payment method, and customer profile to separate real churn drivers from surface-level correlations.

✅ **Data Cleaning & Exploratory Data Analysis (Python)** — 8 key findings, with deeper investigation into segments and interactions driving churn

✅ **Business Querying (SQL)** — 5 targeted queries extracting segment-level churn and revenue insights

✅ **Interactive Dashboard (Power BI)** — 3-page executive dashboard (Home, Overview, Deep Dive) with KPIs, drill-down visuals, and page navigation

✅ **Formal Report** — Business problem statement, findings, and strategic recommendations, delivered as a professional Word document

---

## 🧭 Workflow

![Project Workflow](ProjectWorkflow.jpeg)



## 💡 Key Insight

> **Fiber optic customers without Tech Support churn at ~50%, more than double the rate of those with it (~23%).** This is the single highest-risk segment in the dataset, and it is one that the company can directly act on.




## 🔍 Key EDA Findings (Python)

| # | Analysis | Key Finding |
|---|----------|-------------|
| 1 | **Tenure** | Churn is highest in the first 1-5 months. Customers who stay past 12 months become far more loyal |
| 2 | **Monthly Charges** | Customers paying $20-$30 churn at just **10.33%**, while those paying $75-$120 churn at **34.67%** |
| 3 | **"Trapped" Customer Persona** | Among high-billing customers, churn falls sharply as add-ons increase: from about 57-60% with 0 add-ons to just 3-10% with 6 add-ons. This holds whether the customer is Alone, a Couple, or a Family, so add-on count matters more than household type |
| 4 | **Contract Type** | Month-to-month churns at **42.71%**, vs
