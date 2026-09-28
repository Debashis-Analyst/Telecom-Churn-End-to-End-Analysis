
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

📄 Full findings with business recommendations are in the [Project Report](./Telecom_Churn_Analysis_Report.docx).


## 🗄️ SQL: From Insight to Action

The EDA identified the high-risk customer groups. SQL was then used the way analysts use it on the job: to extract the exact customer lists behind each finding, split by current churn status, so retention and marketing teams know who to contact.

| # | Customer List Extracted | Customers | Still Active | Already Left | Churn Rate | Business Use |
|---|------------------------|-----------|--------------|--------------|------------|--------------|
| 1 | Month-to-month + Electronic check | 1,850 | 856 | 994 | 53.73% | Retention offers to move active customers to auto-pay or a longer contract |
| 2 | Fiber optic without Tech Support | 2,230 | 1,129 | 1,101 | 49.37% | Bundle or discount Tech Support for active customers |
| 3 | Senior citizens without Tech Support | 830 | 410 | 420 | 50.60% | Prioritise seniors in the Tech Support rollout |
| 4 | High-billing customers with 0-2 add-ons | 1,421 | 662 | 759 | 53.41% | Offer discounted add-on bundles |

**Query 5: Cross-check.** A GROUP BY on Contract × Payment Method reproduces the Python results in SQL. Month-to-month + Electronic check is the highest-churn combination at **53.73%**, ahead of the other month-to-month payment methods (31.58–34.13%). Electronic check is also highest within One-year (18.44%) and Two-year (7.74%) contracts.

Queries are in [`Analysis.sql`](./Analysis.sql).



## 🗄️ SQL: From Insight to Action

The EDA identified the high-risk customer groups. SQL was then used the way analysts use it on the job: to fetch the exact customer lists behind each finding, including current churn status, so retention and marketing teams know who to contact.

| # | Customer List Fetched | Business Use |
|---|----------------------|--------------|
| 1 | Month-to-month customers paying by electronic check | Offer auto-pay or a longer contract to those still active; build a win-back list from those who left |
| 2 | Fiber optic customers without Tech Support | Bundle or discount Tech Support |
| 3 | Senior citizens without Tech Support | Prioritise seniors in the Tech Support rollout |
| 4 | High-billing customers with 0-2 add-ons | Offer discounted add-on bundles |
| 5 | Churn rate by Contract × Payment Method (GROUP BY) | Cross-checks the Python results in SQL |

Queries are in [`Analysis.sql`](./Analysis.sql).
---
