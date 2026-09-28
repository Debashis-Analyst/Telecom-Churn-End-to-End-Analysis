use telcom;

/*1 . The EDA identified Month-to-month + Electronic check as the highest-churn segment (~53.7%). 
This query extracts the full customer list for this 
segment — including current churn status — so the retention team can target still-active customers for prevention,
 and marketing can build a separate list for those who already left.*/
 

SELECT * FROM TELCOM_CHURN;


SELECT CUSTOMER_ID, GENDER,
		TENURE_MONTH, CONTRACT,
		PAYMENT_METHOD, HOUSEHOLD_TYPE,
        CHURN

FROM TELCOM_CHURN
WHERE CONTRACT = 'MONTH-TO-MONTH' AND PAYMENT_METHOD = 'ELECTRONIC CHECK'
ORDER BY CHURN, TENURE_MONTH ASC;

/* 2.1 The EDA identified Fiber optic customers 
without Tech Support as the highest-risk segment overall (~50% churn — nearly double DSL's rate without support).
 This query extracts that customer list so the company can prioritize offering or bundling Tech Support to this specific group, 
which showed the single largest churn-reduction opportunity in the analysis.*/



SELECT CUSTOMER_ID, GENDER,
		SENIOR_CITIZEN_STATUS,
		INTERNET_SERVICE, TENURE_MONTH, 
        TECH_SUPPORT, MONTHLY_BILLING_CATEGORY,
        HOUSEHOLD_TYPE,CHURN

FROM TELCOM_CHURN
WHERE INTERNET_SERVICE = 'FIBER OPTIC' AND TECH_SUPPORT = 'NO'
ORDER BY SENIOR_CITIZEN_STATUS DESC, CHURN DESC;


/* 2.2 The EDA found that Senior Citizens without Tech Support churn at ~51%, 
notably higher than non-seniors without Tech Support (~39%) — the largest gap of any group tested. 
This query extracts all Senior Citizens without Tech Support (across all internet service types),
 so the company can prioritize this group when rolling out the Tech Support bundling recommendation.*/
 
 
SELECT CUSTOMER_ID, GENDER,
		SENIOR_CITIZEN_STATUS,
		INTERNET_SERVICE, TENURE_MONTH, 
        TECH_SUPPORT, MONTHLY_BILLING_CATEGORY,
        HOUSEHOLD_TYPE,CHURN
        
FROM TELCOM_CHURN
WHERE SENIOR_CITIZEN_STATUS = 'YES' AND TECH_SUPPORT = 'NO'
ORDER BY  CHURN DESC;






/* 3. The EDA found that among High-billing customers, 
churn drops sharply as add-on count increases — from ~57-60% churn at 0 add-ons down to ~3-10% at 6 add-ons,
 regardless of household type. This query extracts High-billing customers with 0-2 add-ons, 
the segment with the highest churn risk, so the company can target them with  add-on bundles.*/



SELECT CUSTOMER_ID, GENDER,
		HOUSEHOLD_TYPE, TENURE_MONTH,
		ADD_ON_COUNT, MONTHLY_BILLING_CATEGORY, 
        CHURN
        
FROM TELCOM_CHURN
WHERE  MONTHLY_BILLING_CATEGORY ='HIGH' AND ADD_ON_COUNT IN (0,1,2)
ORDER BY HOUSEHOLD_TYPE, ADD_ON_COUNT ;



/* 4 The Python EDA found that churn rate varies sharply by Contract type and Payment Method combined, 
with Month-to-month + Electronic check reaching ~53.7% churn.
 This query recreates that same aggregation using SQL's GROUP BY, 
 to validate the finding and demonstrate the same analysis can be performed directly in SQL.*/
 
 
 SELECT  CONTRACT, PAYMENT_METHOD,
			 AVG(CHURN_FLAG) AS AVG_CHURN
FROM TELCOM_CHURN
GROUP BY 1,2
ORDER BY CONTRACT,  AVG(CHURN_FLAG) DESC;
             
		
		 
			



	