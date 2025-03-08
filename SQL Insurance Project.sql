-- Task 1: Database Schema Creation

CREATE DATABASE insurance_db;

-- Define tables: Customers, Policies, Claims, PolicyTypes.
    -- Include fields such as CustomerID, PolicyID, ClaimID, PolicyTypeID, ClaimAmount, ClaimDate, 
	-- PolicyStartDate, PolicyEndDate, etc.
Use insurance_db;
-- Customers Table---------
CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10)
);

-- 2. PolicyTypes Table

CREATE TABLE PolicyTypes (
    PolicyTypeID SERIAL PRIMARY KEY,
    PolicyTypeName VARCHAR(50),
    Description TEXT
);

-- 3. Policies Table

CREATE TABLE Policies (
    PolicyID SERIAL PRIMARY KEY,
    CustomerID INT REFERENCES Customers(CustomerID),
    PolicyTypeID INT REFERENCES PolicyTypes(PolicyTypeID),
    PolicyStartDate DATE,
    PolicyEndDate DATE,
    Premium DECIMAL(10,2)
);

-- 4. Claims Table

CREATE TABLE Claims (
    ClaimID SERIAL PRIMARY KEY,
    PolicyID INT REFERENCES Policies(PolicyID),
    ClaimDate DATE,
    ClaimAmount DECIMAL(10,2),
    ClaimDescription TEXT,
    ClaimStatus VARCHAR(50)
);

INSERT INTO PolicyTypes (PolicyTypeName, Description) VALUES
('Auto', 'Insurance coverage for automobiles'),
('Home', 'Insurance coverage for homes and property'),
('Health', 'Insurance coverage for health-related expenses'),
('Life', 'Insurance coverage for life and death benefits');


INSERT INTO Customers (FirstName, LastName, DateOfBirth, Gender, Address, City, State, ZipCode) VALUES
('Emily', 'Johnson', '1990-01-17', 'F', '789 Oak Dr', 'Phoenix', 'AZ', '85001'),
('James', 'Smith', '1985-06-22', 'M', '456 Pine St', 'Los Angeles', 'CA', '90001'),
('Linda', 'Davis', '1972-12-05', 'F', '123 Elm St', 'Chicago', 'IL', '60601'),
('Michael', 'Wilson', '1980-02-13', 'M', '321 Maple Ave', 'Houston', 'TX', '77001'),
('Sarah', 'Taylor', '1995-08-30', 'F', '987 Birch Rd', 'New York', 'NY', '10001'),
('David', 'Moore', '1988-07-14', 'M', '654 Cedar Ln', 'San Francisco', 'CA', '94101'),
('Sophia', 'Brown', '1992-09-25', 'F', '222 Oak Blvd', 'Austin', 'TX', '73301'),
('Daniel', 'Miller', '1996-04-18', 'M', '456 Pine St', 'Boston', 'MA', '02101'),
('Emily', 'Martinez', '1994-03-17', 'F', '777 Maple St', 'Denver', 'CO', '80201'),
('John', 'Garcia', '1983-05-23', 'M', '101 Birch Rd', 'Miami', 'FL', '33101'),
('Olivia', 'Rodriguez', '1987-11-03', 'F', '321 Oak Dr', 'Seattle', 'WA', '98001'),
('Ethan', 'Wilson', '1991-02-21', 'M', '555 Pine Blvd', 'San Diego', 'CA', '92101'),
('Ava', 'Martinez', '1993-05-30', 'F', '777 Birch Blvd', 'Dallas', 'TX', '75201'),
('Jacob', 'Hernandez', '1997-08-14', 'M', '888 Cedar Ln', 'Las Vegas', 'NV', '89101'),
('Isabella', 'Lopez', '1998-11-09', 'F', '333 Oak Blvd', 'Phoenix', 'AZ', '85002'),
('Mason', 'Gonzalez', '1994-02-28', 'M', '666 Pine St', 'Charlotte', 'NC', '28201'),
('Amelia', 'Perez', '1990-01-10', 'F', '234 Birch Rd', 'Tampa', 'FL', '33601'),
('Lucas', 'Sanchez', '1989-07-01', 'M', '555 Maple Rd', 'Orlando', 'FL', '32801'),
('Charlotte', 'Anderson', '1992-11-13', 'F', '888 Oak Blvd', 'Detroit', 'MI', '48201'),
('Elijah', 'Thomas', '1984-06-12', 'M', '999 Birch Blvd', 'Minneapolis', 'MN', '55101');


INSERT INTO Policies (CustomerID, PolicyTypeID, PolicyStartDate, PolicyEndDate, Premium) VALUES
(1, 1, '2021-01-01', '2022-01-01', 1200.00),
(2, 2, '2021-02-01', '2022-02-01', 1500.00),
(2, 3, '2021-03-01', '2022-03-01', 2000.00),
(4, 4, '2021-04-01', '2022-04-01', 2500.00),
(5, 1, '2021-05-01', '2022-05-01', 1300.00),
(6, 2, '2021-06-01', '2022-06-01', 1800.00),
(6, 3, '2021-07-01', '2022-07-01', 2100.00),
(8, 4, '2021-08-01', '2022-08-01', 2600.00),
(9, 1, '2021-09-01', '2022-09-01', 1400.00),
(10, 2, '2021-10-01', '2022-10-01', 1600.00),
(11, 3, '2021-11-01', '2022-11-01', 2200.00),
(12, 4, '2021-12-01', '2022-12-01', 2700.00),
(12, 1, '2022-01-01', '2023-01-01', 1250.00),
(14, 2, '2022-02-01', '2023-02-01', 1550.00),
(15, 3, '2022-03-01', '2023-03-01', 2050.00),
(16, 4, '2022-04-01', '2023-04-01', 2550.00),
(17, 1, '2022-05-01', '2023-05-01', 1350.00),
(18, 2, '2022-06-01', '2023-06-01', 1850.00),
(19, 3, '2022-07-01', '2023-07-01', 2150.00),
(1, 4, '2022-08-01', '2023-08-01', 2650.00),
(1, 1, '2022-09-01', '2023-09-01', 1400.00),
(3, 2, '2022-10-01', '2023-10-01', 1700.00),
(3, 3, '2022-11-01', '2023-11-01', 2300.00),
(4, 4, '2022-12-01', '2023-12-01', 2800.00),
(5, 1, '2023-01-01', '2024-01-01', 1500.00),
(6, 2, '2023-02-01', '2024-02-01', 1900.00),
(7, 3, '2023-03-01', '2024-03-01', 2400.00),
(8, 4, '2023-04-01', '2024-04-01', 2900.00),
(9, 1, '2023-05-01', '2024-05-01', 1550.00),
(10, 2, '2023-06-01', '2024-06-01', 1950.00),
(11, 3, '2023-07-01', '2024-07-01', 2450.00),
(12, 4, '2023-08-01', '2024-08-01', 2950.00),
(13, 1, '2023-09-01', '2024-09-01', 1600.00),
(14, 2, '2023-10-01', '2024-10-01', 2000.00),
(15, 3, '2023-11-01', '2024-11-01', 2500.00),
(16, 4, '2023-12-01', '2024-12-01', 3000.00),
(17, 1, '2024-01-01', '2025-01-01', 1650.00),
(18, 2, '2024-02-01', '2025-02-01', 2050.00),
(19, 3, '2024-03-01', '2025-03-01', 2550.00),
(20, 4, '2024-04-01', '2025-04-01', 3050.00),
(1, 2, '2024-05-01', '2025-05-01', 2500.00),
(2, 1, '2024-06-01', '2025-06-01', 1300.00),
(3, 3, '2024-07-01', '2025-07-01', 1700.00),
(4, 1, '2024-08-01', '2025-08-01', 1600.00),
(5, 2, '2024-09-01', '2025-09-01', 2100.00),
(6, 3, '2024-10-01', '2025-10-01', 1900.00),
(7, 1, '2024-11-01', '2025-11-01', 1400.00),
(8, 2, '2024-12-01', '2025-12-01', 2200.00);


INSERT INTO Claims (PolicyID, ClaimDate, ClaimAmount, ClaimDescription, ClaimStatus) VALUES
(1, '2021-06-15', 5000.00, 'Car accident', 'Approved'),
(2, '2021-07-20', 10000.00, 'House fire', 'Pending'),
(3, '2021-08-10', 2000.00, 'Medical emergency', 'Approved'),
(4, '2021-09-05', 3000.00, 'Water damage', 'Rejected'),
(5, '2021-10-17', 1500.00, 'Theft', 'Approved'),
(6, '2021-11-25', 7500.00, 'Vehicle collision', 'Pending'),
(7, '2021-12-18', 4500.00, 'Flood damage', 'Approved'),
(8, '2022-01-20', 10000.00, 'Fire damage', 'Pending'),
(9, '2022-02-15', 6000.00, 'Vandalism', 'Approved'),
(10, '2022-03-22', 4000.00, 'Tree damage', 'Rejected'),
(11, '2022-04-19', 8500.00, 'Hailstorm', 'Approved'),
(12, '2022-05-14', 2000.00, 'Accidental injury', 'Approved'),
(13, '2022-06-02', 3000.00, 'Luggage lost', 'Pending'),
(14, '2022-07-08', 5000.00, 'Mold damage', 'Approved'),
(15, '2022-08-16', 10000.00, 'Medical emergency', 'Pending'),
(16, '2022-09-23', 2500.00, 'Auto theft', 'Approved'),
(17, '2022-10-11', 7000.00, 'Home break-in', 'Pending'),
(18, '2022-11-04', 8000.00, 'Roof damage', 'Approved'),
(19, '2022-12-20', 4500.00, 'Wind damage', 'Pending'),
(20, '2023-01-13', 5500.00, 'Car accident', 'Approved'),
(21, '2023-02-25', 9000.00, 'Fire damage', 'Pending'),
(22, '2023-03-12', 1000.00, 'Minor accident', 'Approved'),
(23, '2023-04-03', 6500.00, 'House burglary', 'Pending'),
(24, '2023-05-14', 10000.00, 'Flood', 'Approved'),
(25, '2023-06-17', 3000.00, 'Water pipe burst', 'Approved'),
(26, '2023-07-26', 7000.00, 'Medical expense', 'Pending'),
(27, '2023-08-09', 2500.00, 'Fallen tree damage', 'Approved'),
(28, '2023-09-11', 4000.00, 'Electrical failure', 'Approved'),
(29, '2023-10-13', 3500.00, 'Car accident', 'Pending'),
(30, '2023-11-20', 8000.00, 'House fire', 'Approved'),
(31, '2024-01-15', 5000.00, 'Car accident', 'Approved'),
(32, '2024-02-10', 12000.00, 'House fire', 'Pending'),
(33, '2024-03-05', 2500.00, 'Medical treatment', 'Rejected'),
(34, '2024-04-22', 3000.00, 'Water damage', 'Approved'),
(35, '2024-05-14', 1500.00, 'Theft', 'Pending'),
(36, '2024-06-30', 7000.00, 'Hailstorm damage', 'Approved'),
(37, '2024-07-10', 4500.00, 'Vandalism', 'Approved'),
(38, '2024-08-20', 8000.00, 'Flood damage', 'Pending'),
(39, '2024-09-15', 9000.00, 'Accident with another vehicle', 'Approved'),
(40, '2024-10-30', 13000.00, 'Fire in garage', 'Rejected');

Select * from claims;
Select * from customers;
Select * from policies;
Select *  from policytypes;

--- sql queries 

-- 1. What are the top 5 customers who have the highest premium totals in 2023?

SELECT CONCAT(c.FirstName, ' ', c.LastName) AS full_name,
       SUM(p.Premium) AS TotalPremium
FROM Policies p
JOIN Customers c
ON p.CustomerID = c.CustomerID
WHERE p.PolicyStartDate BETWEEN '2023-01-01' AND '2023-12-31'
Group bY c.CustomerID
ORDER BY TotalPremium DESC
LIMIT 5;

-- 2. How many claims have a status of 'Approved' and were made in the last 12 months?

SELECT COUNT(*) AS ApprovedClaimsLast12Months
FROM Claims
WHERE ClaimStatus = 'Approved' 
	AND ClaimDate >= CURRENT_DATE - INTERVAL 12 MONTH;

-- 3. What is the total premium for policies that have claims pending or approved status?

SELECT SUM(p.Premium) AS TotalPremium
FROM Policies p
JOIN Claims cl ON p.PolicyID = cl.PolicyID
WHERE cl.ClaimStatus IN ('Approved', 'Pending');

-- 4. What is the running total of premiums for each customer ordered by policy start date?

SELECT c.CustomerID,
       CONCAT(c.FirstName, ' ', c.LastName) AS full_name, 
       p.PolicyStartDate,
       p.Premium,
       SUM(p.Premium) OVER (PARTITION BY c.CustomerID ORDER BY p.PolicyStartDate) AS RunningTotal
FROM Policies p
JOIN Customers c
ON p.CustomerID = c.CustomerID
ORDER BY c.CustomerID, p.PolicyStartDate;

-- 5. What is the average claim amount for each customer, including those who have not yet filed any claims?

WITH ClaimData AS (
    SELECT c.CustomerID,
           AVG(cl.ClaimAmount) AS AverageClaimAmount
    FROM Customers c
    LEFT JOIN Policies p
    ON c.CustomerID = p.CustomerID
    LEFT JOIN Claims cl
    ON p.PolicyID = cl.PolicyID
    GROUP BY c.CustomerID
)
SELECT c.FirstName,
       c.LastName,
       ROUND(COALESCE(cd.AverageClaimAmount, 0), 2) AS AverageClaimAmount
FROM Customers c
LEFT JOIN ClaimData cd
ON c.CustomerID = cd.CustomerID
ORDER BY c.LastName;

-- 6. Which customers have had a claim amount greater than $5000 for the last two claims they made?

WITH RankedClaims AS (
    SELECT cl.ClaimID,
           p.CustomerID,
           cl.ClaimAmount,
           cl.ClaimDate,
           ROW_NUMBER() OVER (PARTITION BY p.CustomerID ORDER BY cl.ClaimDate DESC) AS ClaimRank
    FROM Claims cl
    JOIN Policies p 
      ON cl.PolicyID = p.PolicyID
)
SELECT CONCAT(c.FirstName, ' ', c.LastName) AS full_name,
       rc.ClaimAmount,
       rc.ClaimDate
FROM RankedClaims rc
JOIN Customers c
  ON rc.CustomerID = c.CustomerID
WHERE rc.ClaimRank <= 2
  AND rc.ClaimAmount > 5000
ORDER BY full_name, rc.ClaimDate DESC;

-- 1. Customer Segmentation Query
SELECT 
    c.CustomerID, 
    CONCAT(c.FirstName, ' ', c.LastName) AS full_name,
    c.DateOfBirth, 
    TIMESTAMPDIFF(YEAR, c.DateOfBirth, CURDATE()) AS Age, 
    SUM(p.Premium) AS TotalPremium,
    CASE 
        WHEN SUM(p.Premium) < 2000 THEN 'Low Spender'
        WHEN SUM(p.Premium) BETWEEN 2000 AND 5000 THEN 'Medium Spender'
        ELSE 'High Spender'
    END AS PremiumLevel,
    CASE 
        WHEN TIMESTAMPDIFF(YEAR, c.DateOfBirth, CURDATE()) < 30 THEN 'Young'
        WHEN TIMESTAMPDIFF(YEAR, c.DateOfBirth, CURDATE()) BETWEEN 30 AND 60 THEN 'Middle-aged'
        ELSE 'Senior'
    END AS AgeGroup
FROM Customers c
LEFT JOIN Policies p ON c.CustomerID = p.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.DateOfBirth
ORDER BY TotalPremium DESC;

-- 2. Stored Procedure for Claim Insertion with Validation
DROP PROCEDURE IF EXISTS InsertClaimWithCheck;


DELIMITER $$

CREATE PROCEDURE InsertClaimWithCheck(
    IN p_PolicyID INT, 
    IN p_ClaimDate DATE, 
    IN p_ClaimAmount DECIMAL(10,2), 
    IN p_ClaimDescription TEXT, 
    IN p_ClaimStatus VARCHAR(50)
)
BEGIN
    -- Handle NULL or negative claim amount
    IF p_ClaimAmount < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Claim amount cannot be null or negative';
    END IF;

    -- Insert into Claims table
    INSERT INTO Claims (PolicyID, ClaimDate, ClaimAmount, ClaimDescription, ClaimStatus)
    VALUES (p_PolicyID, p_ClaimDate, p_ClaimAmount, p_ClaimDescription, p_ClaimStatus);

    -- Success message (optional)
    SELECT 'Claim inserted successfully' AS Message;
END $$

DELIMITER ;

-- 3. Calling the Stored Procedure (Example)
CALL InsertClaimWithCheck(41, '2025-01-21', NULL, 'Car accident', 'Pending');


-- 9. What is the performance impact of frequent querying of large claims data? How would you optimize query performance?

CREATE INDEX idx_claim_date ON Claims (ClaimDate, ClaimStatus);

EXPLAIN SELECT * FROM claims WHERE ClaimDate > '2023-12-31' AND claimstatus = 'Pending';

-- 10. Create a user role that allows access only to customer names and claim amounts (no policy details).

CREATE ROLE ClaimAccessUser;

-- Grant permissions:

-- Create Customers_View with only the required columns
CREATE OR REPLACE VIEW Customers_View AS
SELECT FirstName, LastName
FROM Customers;

-- Create Claims_View with only the required column
CREATE OR REPLACE VIEW Claims_View AS
SELECT ClaimAmount
FROM Claims;

-- Grant SELECT on the views to ClaimAccessUser
GRANT SELECT ON Customers_View TO ClaimAccessUser;
GRANT SELECT ON Claims_View TO ClaimAccessUser;

-- Assign role to a user:

CREATE USER 'ClaimAccessUser'@'%' IDENTIFIED BY 'password';


-- Grant SELECT permission on Customers_View
GRANT SELECT ON Customers_View TO ClaimAccessUser;

-- Grant SELECT permission on Claims_View
GRANT SELECT ON Claims_View TO ClaimAccessUser;

-- If the user already has broader permissions or you need to revoke other permissions (for example, if the user has INSERT or UPDATE rights 
-- they shouldn't have), you can revoke those as well:

-- Revoke any unwanted permissions
REVOKE INSERT, UPDATE, DELETE ON Customers_View FROM ClaimAccessUser;
REVOKE INSERT, UPDATE, DELETE ON Claims_View FROM ClaimAccessUser;


