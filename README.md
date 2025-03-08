# SQL-Insurance-Claim-Analysis


## Overview
This capstone project demonstrates the application of advanced SQL techniques to analyze and manage **insurance claim data**. The project simulates a real-world insurance company's claims processing system by utilizing a structured database and executing complex queries to extract valuable business insights.

## Prerequisites
- **Database System:** [MySQL](https://www.mysql.com/)
- **SQL Knowledge:** Intermediate to Advanced SQL techniques

## Database Schema
The insurance database consists of four interconnected tables:

### 1. Customers Table
Stores customer information.
- **CustomerID:** Primary Key
- **FirstName, LastName, DateOfBirth, Gender:** Personal details
- **Address, City, State, ZipCode:** Location details

### 2. PolicyTypes Table
Defines different types of insurance policies.
- **PolicyTypeID:** Primary Key
- **PolicyTypeName, Description:** Policy classification

### 3. Policies Table
Stores details about policies purchased by customers.
- **PolicyID:** Primary Key
- **CustomerID:** Foreign Key (References Customers)
- **PolicyTypeID:** Foreign Key (References PolicyTypes)
- **PolicyStartDate, PolicyEndDate, Premium:** Coverage details

### 4. Claims Table
Tracks claims made on policies.
- **ClaimID:** Primary Key
- **PolicyID:** Foreign Key (References Policies)
- **ClaimDate, ClaimAmount, ClaimDescription, ClaimStatus:** Claim details

## Objectives
The project focuses on solving real-world business problems in SQL-driven environments. Key goals include:
- **Utilizing Advanced SQL Queries** for business insights
- **Implementing Data Aggregation** using CTEs, Window Functions, and Joins
- **Enhancing Query Performance** through Indexing
- **Ensuring Data Integrity and Security** with User Roles

## Business Use Cases and Solutions

### 1. Identifying High-Value Customers
**Query:** Find the top 5 customers who paid the highest premiums in 2023.
```sql
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS full_name, 
       SUM(p.Premium) AS TotalPremium
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID
WHERE p.PolicyStartDate BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY c.CustomerID
ORDER BY TotalPremium DESC
LIMIT 5;
```

### 2. Approved Claims Analysis
**Query:** Count approved claims in the last 12 months.
```sql
SELECT COUNT(*) AS ApprovedClaimsLast12Months
FROM Claims
WHERE ClaimStatus = 'Approved'
  AND ClaimDate >= CURRENT_DATE - INTERVAL '12 months';
```

### 3. Premium Analysis for Policies with Claims
**Query:** Calculate total premium for policies with pending or approved claims.
```sql
SELECT SUM(p.Premium) AS TotalPremium
FROM Policies p
JOIN Claims cl ON p.PolicyID = cl.PolicyID
WHERE cl.ClaimStatus IN ('Approved', 'Pending');
```

### 4. Tracking Customer Premium Payments Over Time
**Query:** Running total of premiums for each customer ordered by policy start date.
```sql
SELECT c.CustomerID,
       CONCAT(c.FirstName, ' ', c.LastName) AS full_name, 
       p.PolicyStartDate,
       p.Premium,
       SUM(p.Premium) OVER (PARTITION BY c.CustomerID ORDER BY p.PolicyStartDate) AS RunningTotal
FROM Policies p
JOIN Customers c ON p.CustomerID = c.CustomerID
ORDER BY c.CustomerID, p.PolicyStartDate;
```

### 5. Customer Segmentation for Targeted Marketing
**Query:** Categorizing customers by premium spending and age.
```sql
SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS full_name,
    DATE_PART('year', AGE(c.DateOfBirth)) AS Age, 
    SUM(p.Premium) AS TotalPremium,
    CASE 
        WHEN SUM(p.Premium) < 2000 THEN 'Low Spender'
        WHEN SUM(p.Premium) BETWEEN 2000 AND 5000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS PremiumLevel,
    CASE 
        WHEN DATE_PART('year', AGE(c.DateOfBirth)) < 30 THEN 'Young'
        WHEN DATE_PART('year', AGE(c.DateOfBirth)) BETWEEN 30 AND 60 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS AgeGroup
FROM Customers c
LEFT JOIN Policies p ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID
ORDER BY TotalPremium DESC;
```

### 6. Optimizing Query Performance
**Query:** Indexing frequently queried columns to speed up execution.
```sql
CREATE INDEX idx_claim_date ON Claims (ClaimDate, ClaimStatus);
```

**Query:** Analyze execution plan for performance insights.
```sql
EXPLAIN SELECT * FROM claims WHERE ClaimDate > '2023-12-31' AND ClaimStatus = 'Pending';
```

### 7. Handling Data Integrity Issues
**Query:** Preventing NULL claim amounts during data entry.
```sql
CREATE OR REPLACE PROCEDURE InsertClaimWithCheck(
    p_PolicyID INT, 
    p_ClaimDate DATE, 
    p_ClaimAmount DECIMAL, 
    p_ClaimDescription TEXT, 
    p_ClaimStatus VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF p_ClaimAmount IS NULL THEN
        RAISE EXCEPTION 'Claim amount cannot be null';
    ELSE
        INSERT INTO Claims (PolicyID, ClaimDate, ClaimAmount, ClaimDescription, ClaimStatus)
        VALUES (p_PolicyID, p_ClaimDate, p_ClaimAmount, p_ClaimDescription, p_ClaimStatus);
    END IF;
END;
$$;
```

### 8. Implementing Role-Based Data Access
**Query:** Create restricted user roles to limit data access.
```sql
CREATE ROLE ClaimAccessUser;
```
```sql
CREATE OR REPLACE VIEW Customers_View AS
SELECT FirstName, LastName FROM Customers;
```
```sql
GRANT SELECT ON Customers_View TO ClaimAccessUser;
```

## Future Enhancements
- **Data Visualization:** Integrating with Power BI or Tableau.
- **Automated Reporting:** Setting up scheduled reports with SQL.
- **Machine Learning Integration:** Predicting fraud claims using AI.

## Conclusion
This project showcases advanced SQL techniques applied to a real-world insurance claims database. The focus on **query optimization, data integrity, and role-based security** highlights best practices in SQL for business applications. The structured queries and indexing strategies ensure that data handling remains efficient and scalable for larger datasets.

By leveraging SQL effectively, businesses can **enhance decision-making, identify risks, and optimize claims processing** to improve overall operational efficiency.

