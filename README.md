 End-to-End Supply Chain Analytics & AI-Powered Decision Intelligence Platform

 Overview

This project is an end-to-end supply chain analytics and predictive intelligence solution developed using SQL, Power BI, Python, Machine Learning, and XGBoost.

The platform transforms raw supply chain data into actionable business insights through data engineering, business intelligence reporting, predictive analytics, and AI-driven decision support.

The solution analyzes over 180,000 supply chain transactions and provides visibility into sales performance, delivery operations, inventory trends, profitability, demand patterns, and shipment risk prediction.

 Business Objectives

* Analyze global supply chain performance
* Monitor sales and profitability across regions
* Evaluate delivery performance and shipment risks
* Identify operational bottlenecks
* Support inventory and order management decisions
* Predict late delivery risks using machine learning
* Enable data-driven supply chain optimization

 Tech Stack

SQL

MySQL

Power BI

DAX

Python

Pandas

NumPy

Scikit-Learn

XGBoost

Joblib

Matplotlib

Seaborn

 Project Architecture

Raw Supply Chain Data

↓

SQL Data Cleaning & Transformation

↓

Relational Data Modeling

↓

Power BI Dashboard Development

↓

Feature Engineering

↓

Machine Learning Model Development

↓

Shipment Risk Prediction Engine

↓

AI-Powered Supply Chain Intelligence

 Dataset

Data Source: DataCo Supply Chain Dataset

Records Analyzed: 180,519+

Features Used: 18 Engineered and Business Features

Target Variable: Late Delivery Risk

The dataset contains information related to:

* Orders
* Customers
* Products
* Shipping Operations
* Sales Transactions
* Profitability Metrics
* Delivery Performance

 SQL Data Engineering

The raw dataset was transformed into structured analytical tables using SQL.

Key SQL Activities:

* Data Cleaning
* Data Validation
* Data Transformation
* KPI Generation
* Regional Sales Analysis
* Profitability Analysis
* Delivery Performance Analysis
* Shipping Risk Analysis
* Customer Segment Analysis
* Monthly Trend Analysis

Power BI Dashboard

The dashboard contains three analytical modules.

 Executive Overview

Key Metrics:

* Total Sales: ₹27.70M
* Total Profit: ₹3.01M
* Total Orders: 288K
* Risky Shipments: 25K

Visual Analysis:

* Sales by Region
* Monthly Sales Trends
* Profit by Product Category
* Risky Shipments by Shipping Mode

Delivery Performance Analytics

Key Metrics:

* Total Late Deliveries: 36K
* Advance Shipments: 15K
* Cancelled Shipments: 3K

Visual Analysis:

* Delivery Status Breakdown
* Late Deliveries by Region
* Delivery Status by Shipping Mode
* Monthly Late Delivery Trends
* Scheduled vs Actual Shipping Days

Inventory & Order Analytics

Key Metrics:

* Total Order Quantity: 384K
* Total Revenue: ₹36.78M
* Average Profit Per Order: ₹21.97
* Profit Margin: 10.78%

Visual Analysis:

* Order Quantity by Category
* Profit by Department
* Monthly Order Trends
* Profit vs Revenue Analysis
* Top Categories by Order Volume

 Feature Engineering

To improve prediction performance, several business-focused features were engineered.

Created Features:

* Shipping Delay
* Revenue Per Item
* Discount Impact
* Profit Efficiency
* Urgency Ratio

These engineered variables significantly improved predictive performance and operational insight generation.

 Machine Learning Solution

Shipment Delay Prediction

A high-performance XGBoost Classification model was developed to predict shipment delay risk.

Objective:

Predict whether an order is likely to experience late delivery before shipment execution.

Model Performance

Accuracy: 97.45%

Precision: 95.55%

Recall: 100.00%

F1 Score: 97.72%

ROC-AUC Score: 97.38%

Balanced Accuracy: 97.17%

Matthews Correlation Coefficient: 94.95%

Cohen Kappa Score: 94.82%

Log Loss: 0.1077

Brier Score: 0.0247

 Model Optimization

* Feature Engineering
* Stratified Train-Test Split
* XGBoost Hyperparameter Optimization
* Model Persistence using Joblib
* Fast Prediction Workflow
* Automated Model Loading

AI-Powered Prediction Engine

The platform includes a reusable prediction engine that:

* Loads pre-trained models automatically
* Processes new shipment records
* Predicts late delivery risk
* Calculates shipment risk probabilities
* Generates operational recommendations

Prediction Output:

* Late Delivery Risk
* Delay Probability Score
* Operational Risk Assessment

Key Business Insights

* Generated ₹27.70M in sales across global markets
* Identified 25K high-risk shipments
* Detected regions with elevated delivery risk
* Analyzed product category profitability
* Evaluated shipping mode performance
* Improved operational visibility through predictive analytics
* Enabled proactive shipment risk management

 Repository Structure

sql/

powerbi/

python/

models/

dashboard/

README.md

 Future Enhancements

* Demand Forecasting
* Inventory Optimization Models
* Route Optimization
* Real-Time Prediction APIs
* Automated Alert System
* LLM-Based Supply Chain Assistant
* Generative AI Insights Engine


 Author

Abirami Kumarasamy

M.Sc Data Science (Logistics and Supply Chain Management)

