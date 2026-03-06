-- 1. Create a copy of the raw data to work on
CREATE TABLE telco_analytics AS SELECT * FROM telco_churn;

-- 2. Turn off safe updates to allow the cleanup
SET SQL_SAFE_UPDATES = 0;

-- 3. Fix the TotalCharges Blank Space Bug
-- We convert empty strings to '0' so we can change the column type later
UPDATE telco_analytics 
SET TotalCharges = '0' 
WHERE TotalCharges = ' ' OR TotalCharges IS NULL;

-- 4. Change TotalCharges to a Numeric Type
ALTER TABLE telco_analytics 
MODIFY COLUMN TotalCharges DECIMAL(10,2);

-- 5. Standardize SeniorCitizen to Yes/No (Optional, but looks better)
ALTER TABLE telco_analytics MODIFY COLUMN SeniorCitizen VARCHAR(5);
UPDATE telco_analytics SET SeniorCitizen = IF(SeniorCitizen = '1', 'Yes', 'No');

-- 6. Check for any other nulls
SELECT COUNT(*) FROM telco_analytics WHERE Churn IS NULL;

ALTER TABLE telco_analytics ADD COLUMN Tenure_Group VARCHAR(20);

UPDATE telco_analytics
SET Tenure_Group = CASE 
    WHEN tenure <= 12 THEN '0-1 Year'
    WHEN tenure <= 24 THEN '1-2 Years'
    WHEN tenure <= 36 THEN '2-3 Years'
    WHEN tenure <= 48 THEN '3-4 Years'
    WHEN tenure <= 60 THEN '4-5 Years'
    ELSE 'Over 5 Years'
END;

-- Standardizing 'No internet service' to 'No'
UPDATE telco_analytics 
SET OnlineSecurity = 'No', 
    OnlineBackup = 'No', 
    DeviceProtection = 'No', 
    TechSupport = 'No', 
    StreamingTV = 'No', 
    StreamingMovies = 'No'
WHERE InternetService = 'No';

-- Standardizing 'No phone service' to 'No' for MultipleLines
UPDATE telco_analytics 
SET MultipleLines = 'No' 
WHERE PhoneService = 'No';

ALTER TABLE telco_analytics ADD COLUMN Churn_Value INT;

UPDATE telco_analytics 
SET Churn_Value = IF(Churn = 'Yes', 1, 0);

SELECT 
    Contract, 
    Tenure_Group, 
    COUNT(*) as Total_Customers, 
    ROUND(AVG(Churn_Value) * 100, 2) as Churn_Rate_Pct
FROM telco_analytics
GROUP BY Contract, Tenure_Group
ORDER BY Churn_Rate_Pct DESC;
