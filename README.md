
---

## 📌 Project Overview







# 📊 Telecom Customer Churn Analysis

### End-to-End Data Analysis  Python · SQL · Power BI

## 📄 Full findings with business recommendations are in the (Project Report](Telecom-Upload/Final%20Report/Telecom_Churn_Analysis_Report_Debashis.docx)


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
| **Household_Type** | **Family** = Who has dependents · **Couple** = Who has partner, But no dependents · **Alone** = no partner, no dependents | Tests whether household situation affects churn |
| **Tenure_Group** | Tenure split into 12-month bands (0–12, 12–24, … 60–72) | Checks that a pattern is real and not just caused by customer age |


### 🔎 There is a High Billing Category and  How the "High-Billing" Group Was Defined

Customers were grouped by monthly bill into three categories: **Low** (up to $35), **Medium** ($35–$70), and **High** (above $70, up to $120, the maximum in the data). The "high-billing customers" mentioned in the findings are everyone in the **High** category. This lets the analysis focus on the customers who pay the most, and who cost the company the most when they leave.


---



## 💡 Key Insight

> **Fiber optic customers without Tech Support churn at ~50%, more than double the rate of those with it (~23%).** This is the single highest-risk segment in the dataset, and it is one that the company can directly act on.


## 🔍 Key EDA Findings (Python)

| # | Analysis | Key Finding |
|---|----------|-------------|
| 1 | **Tenure** | Customers are most likely to leave in their first 1-5 months after joining. Those who stay past their first year become far more loyal |
| 2 | **Monthly Charges** | Customers paying $20-$30 a month leave at just **10.33%**, while those paying $75-$120 a month leave at **34.67%** |
| 3 | **"Trapped" Customer Persona** | Among customers with high monthly bills, the more extra services they use (like Tech Support or Online Security), the less likely they are to leave: about 57-60% leave with no extra services, but only 3-10% leave with all 6. This holds whether the customer lives Alone, as a Couple, or as a Family, so extra services matter more than household type |
| 4 | **Contract Type** | Customers on a month-to-month plan (no long-term commitment) leave at **42.71%**, vs 11.28% on one-year contracts and 2.85% on two-year contracts |
| 5 | **Contract × Payment Method** | Customers who pay by electronic check (paying manually online each month) leave the most, whichever contract type they are on. Month-to-month customers paying by electronic check reach **53.73%**.
| 6 | **Internet Service** | Customers with Fiber optic internet (the premium, plan) leave at 41.89%, more than double DSL (19.00%) and far above customers with no internet service (7.43%) |
| 7 | **Fiber + Tech Support** | Fiber optic customers *without* a Tech Support plan leave at ~50%, vs ~23% for those *with* one. This is the highest-risk group in the entire dataset |
| 8 | **Senior Citizens + Tech Support** | Senior citizens without Tech Support leave at **50.60%**, vs 38.83% for younger customers without it. With Tech Support, both groups drop sharply (19.62% and 14.55%) |








## 🗄️ SQL: From Insight to Action

The EDA identified the high-risk customer groups. SQL was then used to fetch the exact customer lists behind each finding, so retention and marketing teams know who to contact.

| # | Customer List Fetched | Business Use |
|---|----------------------|--------------|
| 1 | Month-to-month customers paying by electronic check | Offer auto-pay or a longer contract to those still active; build a win-back list from those who left |
| 2 | Fiber optic customers without Tech Support | Bundle or discount Tech Support |
| 3 | Senior citizens without Tech Support | Prioritise seniors in the Tech Support rollout |
| 4 | High-billing customers with 0-2 add-ons | Offer discounted add-on bundles |
| 5 | Churn rate by Contract × Payment Method (GROUP BY) | Cross-checks the Python results in SQL |

## Queries are in [`Analysis.sql`](./Analysis.sql).




---

## 📊 Interactive Power BI Dashboard

The exploratory findings were translated into an interactive executive dashboard designed to give leadership visibility into revenue exposure and direct retention teams toward high-risk segments[cite: 4, 6].

---

### 1. Executive Overview
Monitors top-level subscriber health, baseline attrition, and contract exposure[cite: 6].

![Executive Overview](assets/overview.png)

* **Key KPIs:** Tracks 7,032 total accounts, an overall churn rate of 26.58%, and $139K in monthly recurring revenue currently at risk[cite: 6].
* **Contract Risk:** Month-to-month subscribers leave at 42.71%, whereas long-term commitments (1–2 years) see attrition drop to 11.28% and 2.85%[cite: 6].
* **Payment Friction:** Electronic check payments show an overall churn rate of ~45%, significantly higher than automated credit card or bank transfer options (~15%–17%)[cite: 6].

---

### 2. Deep Dive: Churn Drivers & Prevention
Isolates multi-service interactions to identify root causes and retention opportunities[cite: 5].

![Deep Dive Analysis](assets/deep_dive.png)

* **Fiber Optic Support Gap:** Fiber Optic churn reaches ~50% when Tech Support is missing, but drops to ~23% when Tech Support is bundled[cite: 2, 5].
* **Add-On Protection Curve:** Churn declines steadily across all household groups as customers adopt security and backup services, dropping below 10% for accounts with 5–6 add-ons[cite: 5].
* **Senior Citizen Care:** Senior citizens without Tech Support face a 50.60% churn rate, which drops below 20% when technical assistance is in place[cite: 2, 5].

---


## 🛠️ Tools & Technologies Used
* **Python (Pandas, Matplotlib, Seaborn):** Exploratory data analysis, handling missing values, and engineering custom analytical features[cite: 3, 4].
* **SQL:** Relational querying, cohort grouping, and business aggregations to extract targeted customer win-back lists[cite: 1, 4].
* **Power BI:** Data modeling, DAX measures, dynamic multi-slicers, and interactive multi-page executive reporting[cite: 4, 5, 6].
