
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



## 🛠️ How I Built the Analysis Columns

The raw dataset did not have some of the columns needed to answer the business questions, so I created them in Python (pandas).

| New Column | How It Was Made | Why |
|------------|----------------|-----|
| **Churn_Flag** | Churn "Yes" → 1, "No" → 0 | Lets us calculate churn percentage with a simple average |
| **Billing_Category** | Monthly Charges split into **Low** ($0–35), **Medium** ($35–70), **High** ($70–120) | Groups customers by bill size to see who is at risk |
| **Add_On_Count** | Counted how many of 6 services each customer has: Online Security, Online Backup, Device Protection, Tech Support, Streaming TV, Streaming Movies | Shows how "attached" a customer is to the company |
| **Household_Type** | **Family** = has dependents · **Couple** = has partner, no dependents · **Alone** = no partner, no dependents | Tests whether household situation affects churn |
| **Tenure_Group** | Tenure split into 12-month bands (0–12, 12–24, … 60–72) | Checks that a pattern is real and not just caused by customer age |

### 🔎 Why this matters for the "high-billing" finding

### 🔎 How the "High-Billing" Group Was Defined

Customers were grouped by monthly bill into three categories: **Low** (up to $35), **Medium** ($35–$70), and **High** (above $70, up to $120, the maximum in the data). The "high-billing customers" mentioned in the findings are everyone in the **High** category. This lets the analysis focus on the customers who pay the most, and who cost the company the most when they leave.


---



## 💡 Key Insight

> **Fiber optic customers without Tech Support churn at ~50%, more than double the rate of those with it (~23%).** This is the single highest-risk segment in the dataset, and it is one that the company can directly act on.




## 🔍 Key EDA Findings (Python)

| # | Analysis | Key Finding |
|---|----------|-------------|
| 1 | **Tenure** | Churn is highest in the first 1-5 months. Customers who stay past 12 months become far more loyal |
| 2 | **Monthly Charges** | Customers paying $20-$30 churn at just **10.33%**, while those paying $75-$120 churn at **34.67%** |
| 3 | **"Trapped" Customer Persona** | Among high-billing customers, churn falls sharply as add-ons increase: from about 57-60% with 0 add-ons to just 3-10% with 6 add-ons. This holds whether the customer is Alone, a Couple, or a Family, so add-on count matters more than household type |
| 4 | **Contract Type** | Month-to-month churns at **42.71%**, vs 11.28% for One-year and 2.85% for Two-year contracts |
| 5 | **Contract × Payment Method** | Electronic check has the highest churn in every contract tier. Month-to-month + Electronic check reaches **53.73%**. The pattern holds in every tenure band, so it is not just a byproduct of newer customers |
| 6 | **Internet Service** | Fiber optic churns at 41.89%, more than double DSL (19.00%) and far above customers with no internet service (7.43%) |
| 7 | **Fiber + Tech Support** | Fiber customers *without* Tech Support churn at ~50%, vs ~23% *with* it. This is the single highest-risk segment in the dataset |
| 8 | **Senior Citizens + Tech Support** | Seniors without Tech Support churn at **50.60%**, vs 38.83% for non-seniors without it. With Tech Support, both groups drop sharply (19.62% and 14.55%) |

📄 Full findings with business recommendations are in the [Project Report](./Telecom_Churn_Analysis_Report.docx).

---
