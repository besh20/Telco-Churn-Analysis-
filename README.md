# Telco Customer Retention & Risk
AI-Driven Insights and Predictive Strategy For an IBM Sample Dataset

link to the dataset https://www.kaggle.com/datasets/blastchar/telco-customer-churn

## Business Problem
The telecommunications industry faces a significant challenge with customer "churn" (customers leaving for competitors). This project aims to transition from simple reporting to Prescriptive Analytics by identifying not just who left, but why they left and which current customers are at the highest risk of leaving next.

## Tech Stack
Database: MySQL (Data Cleaning, Transformation, Segment Binning)

Visualization: Power BI

AI/ML Features: Key Influencers Visual (Regression Analysis), Decomposition Tree

Dataset: IBM Telco Churn (7,043 Customers)

## The "Data IQ" Approach (SQL Logic)
Before visualization, I performed a deep-clean in SQL to ensure business-ready accuracy:

The "Zero-Day" Fix: Converted blank strings in TotalCharges to 0 and cast the column as DECIMAL to allow for financial calculations.

Tenure Segmentation: Developed a CASE statement to group customers into 1-year cohorts (e.g., 0-1 Year, 1-2 Years).

Feature Standardization: Normalized boolean fields (SeniorCitizen) and simplified complex categorical noise (e.g., "No Internet Service" $\rightarrow$ "No").

## Key Insights & Results
The Year 1 Crisis: Discovered that 47.44% of customers in their first year on Month-to-Month contracts are churning.

Revenue at Risk: Identified $136.45K in Monthly Recurring Revenue (MRR) currently held by high-risk customer segments.

The "Fiber Optic" Paradox: AI analysis revealed that Fiber Optic users are 2.89x more likely to churn, indicating a potential service-price gap.

Predictive Action: Built a "Hot List" of currently active customers who match the high-risk profile for immediate marketing intervention.

## Dashboard Features
Executive Oversight: High-level KPIs tracking total base and revenue leakage.

Pathways to Churn: A Decomposition Tree allowing stakeholders to drill down into specific risk combinations (e.g., Contract Type + Payment Method).

Searchable Risk Table: A marketing-ready tool with search functionality and "Top N" sorting to prioritize high-value at-risk accounts.

## How to Use This Project
SQL Folder: Contains the cleanup.sql script to transform raw CSV data.

PBIX Folder: Contains the Power BI dashboard file.

ScreenShots: A see through of what the project looks like.
