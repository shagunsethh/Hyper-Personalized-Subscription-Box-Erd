-- Creating a Hyper-Personalized Subscription Box Database

CREATE DATABASE ss_sr_SubscriptionBoxERP;
USE ss_sr_SubscriptionBoxERP;

-- DDL Operations - Creating tables for Hyper-Personalized Subscription Box Database

-- Customers Table
CREATE TABLE Customers (
    Customer_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Address TEXT,
    Subscription_Tier VARCHAR(50)
);

-- Subscription Plans Table
CREATE TABLE SubscriptionPlans (
    Plan_ID INT PRIMARY KEY AUTO_INCREMENT,
    Plan_Name VARCHAR(100),
    Pricing DECIMAL(10, 2),
    Frequency ENUM('Monthly', 'Yearly', 'Quarterly')
);

-- Orders Table
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Plan_ID INT,
    Order_Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled'),
    Dispatch_Date DATE,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Plan_ID) REFERENCES SubscriptionPlans(Plan_ID)
);

-- Product Inventory Table
CREATE TABLE ProductInventory (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100),
    Category VARCHAR(50),
    Stock_Level INT
);

-- Order Details Table
CREATE TABLE OrderDetails (
    OrderDetail_ID INT PRIMARY KEY AUTO_INCREMENT,
    Order_ID INT,
    Product_ID INT,
    Quantity INT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES ProductInventory(Product_ID)
);

-- AI Preferences Table
CREATE TABLE AIPreferences (
    Preference_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Product_Type_Preferences TEXT,
    Allergies TEXT,
    Purchase_History TEXT,
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Suppliers Table
CREATE TABLE Suppliers (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(100),
    Contact_Details TEXT
);

-- Payments Table
CREATE TABLE Payments (
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID INT,
    Amount DECIMAL(10,2),
    Transaction_Date DATETIME,
    Payment_Method ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer'),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
);

-- Inserting dummy data into the tables

-- Insert Customers
INSERT INTO Customers (Name, Email, Address, Subscription_Tier) 
VALUES 
('Aarav Sharma', 'aarav.sharma@gmail.com', '12 MG Road, Delhi', 'Gold'),
('Priya Verma', 'priya.verma@eyahoo.com', '45 Park Street, Kolkata', 'Silver'),
('Rahul Mehta', 'rahul.mehta@outlook.com', '78 Lajpat Nagar, Delhi', 'Platinum'),
('Sneha Iyer', 'sneha.iyer@gmail.com', '32 Indira Nagar, Bangalore', 'Gold'),
('Vikram Singh', 'vikram.singh@gmail.com', '90 Juhu Beach Road, Mumbai', 'Silver'),
('Ananya Nair', 'ananya.nair@gmail.com', '11 Brigade Road, Bangalore', 'Bronze'),
('Kunal Joshi', 'kunal.joshi@gmail.com', '27 Connaught Place, Delhi', 'Platinum'),
('Riya Choudhary', 'riya.choudhary@yahoo.com', '56 MG Road, Pune', 'Gold'),
('Arjun Kapoor', 'arjun.kapoor@yahoo.com', '78 Marine Drive, Mumbai', 'Silver'),
('Meera Pillai', 'meera.pillai@yahoo.com', '23 HSR Layout, Bangalore', 'Bronze'),
('Rajesh Gupta', 'rajesh.gupta@outlook.com', '99 Park Avenue, Chennai', 'Gold'),
('Nikita Rao', 'nikita.rao@outlook.com', '44 Residency Road, Hyderabad', 'Silver'),
('Devansh Malhotra', 'devansh.malhotra@outlook.com', '39 MG Road, Chandigarh', 'Platinum'),
('Sanya Patel', 'sanya.patel@gmail.com', '82 Bandra West, Mumbai', 'Gold'),
('Amit Saxena', 'amit.saxena@gmail.com', '67 Rajaji Nagar, Bangalore', 'Silver'),
('Tanya Bhatt', 'tanya.bhatt@gmail.com', '15 Nehru Place, Delhi', 'Bronze'),
('Harsh Vardhan', 'harsh.vardhan@yahoo.com', '55 Anna Salai, Chennai', 'Gold'),
('Simran Das', 'simran.das@yahoo.com', '101 Gariahat Road, Kolkata', 'Silver'),
('Kartik Sharma', 'kartik.sharma@yahoo.com', '75 North Main Road, Pune', 'Platinum'),
('Neha Agarwal', 'neha.agarwal@outlook.com', '88 Kalyani Nagar, Pune', 'Gold'),
('Rohan Kapoor', 'rohan.kapoor@outlook.com', '11 Ballygunge Circular Road, Kolkata', 'Silver'),
('Pooja Reddy', 'pooja.reddy@outlook.com', '35 Begumpet, Hyderabad', 'Bronze'),
('Varun Nair', 'varun.nair@yahoo.com', '57 Electronic City, Bangalore', 'Gold'),
('Ishita Sen', 'ishita.sen@outlook.com', '90 Salt Lake, Kolkata', 'Silver'),
('Yash Chauhan', 'yash.chauhan@gmail.com', '18 Dadar East, Mumbai', 'Platinum');

-- Insert Subscription Plans
INSERT INTO SubscriptionPlans (Plan_Name, Pricing, Frequency)
VALUES 
('Starter Box', 9.99, 'Monthly'),
('Gold Box', 29.99, 'Monthly'),
('Platinum Box', 79.99, 'Monthly'),
('Annual Premium Box', 199.99, 'Yearly'),
('Festive Special Box', 59.99, 'Quarterly'),
('Wellness Box', 39.99, 'Monthly'),
('Tech Enthusiast Box', 89.99, 'Quarterly');

-- Insert Orders
INSERT INTO Orders (Customer_ID, Plan_ID, Order_Status, Dispatch_Date) 
VALUES 
(1, 2, 'Shipped', '2025-02-05'),
(2, 1, 'Pending', '2025-02-07'),
(3, 3, 'Delivered', '2025-02-02'),
(4, 4, 'Cancelled', '2025-02-06'),
(5, 5, 'Pending', '2025-02-10'),
(6, 6, 'Delivered', '2025-01-30'),
(7, 7, 'Shipped', '2025-02-08'),
(8, 1, 'Cancelled', '2025-02-12'),
(9, 2, 'Shipped', '2025-02-04'),
(10, 3, 'Delivered', '2025-02-01'),
(11, 4, 'Shipped', '2025-02-09'),
(12, 5, 'Pending', '2025-02-15'),
(13, 6, 'Cancelled', '2025-01-28'),
(14, 7, 'Shipped', '2025-02-03'),
(15, 1, 'Pending', '2025-02-11'),
(16, 2, 'Shipped', '2025-02-05'),
(17, 3, 'Delivered', '2025-02-02'),
(18, 4, 'Shipped', '2025-02-07'),
(19, 5, 'Pending', '2025-02-14'),
(20, 6, 'Delivered', '2025-01-29'),
(21, 7, 'Shipped', '2025-02-06'),
(22, 1, 'Pending', '2025-02-13'),
(23, 2, 'Shipped', '2025-02-04'),
(24, 3, 'Delivered', '2025-02-02'),
(25, 4, 'Shipped', '2025-02-08');

-- Insert Product Inventory
INSERT INTO ProductInventory (Product_Name, Category, Stock_Level) 
VALUES 
('Organic Coffee', 'Beverage', 50),
('Scented Candle', 'Home Decor', 30),
('Herbal Tea', 'Beverage', 40),
('Wooden Photo Frame', 'Home Decor', 25),
('Wireless Earbuds', 'Electronics', 15),
('Yoga Mat', 'Fitness', 35),
('Protein Powder', 'Health & Nutrition', 20),
('Luxury Chocolate Box', 'Food', 45),
('Smart Watch', 'Electronics', 10),
('Cotton Bedsheet', 'Home Decor', 28),
('Face Serum', 'Beauty & Personal Care', 22),
('Handmade Soap', 'Beauty & Personal Care', 50),
('Leather Wallet', 'Fashion Accessories', 18),
('Bluetooth Speaker', 'Electronics', 12),
('Organic Honey', 'Food', 38),
('Green Tea Extract', 'Health & Nutrition', 30),
('Essential Oil Set', 'Beauty & Personal Care', 27),
('Fitness Resistance Bands', 'Fitness', 40),
('Portable Power Bank', 'Electronics', 17),
('Silk Scarf', 'Fashion Accessories', 20),
('Natural Almond Butter', 'Food', 33),
('Stainless Steel Water Bottle', 'Fitness', 25),
('Aromatherapy Diffuser', 'Home Decor', 22),
('Gaming Mouse', 'Electronics', 14),
('Handwoven Jute Bag', 'Fashion Accessories', 26);

-- Insert Order Details 
INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity) 
VALUES 
(1, 3, 2),
(2, 5, 1),
(3, 7, 3),
(4, 10, 2),
(5, 12, 4),
(6, 15, 1),
(7, 18, 2),
(8, 20, 3),
(9, 22, 1),
(10, 25, 2),
(11, 2, 5),
(12, 4, 2),
(13, 6, 3),
(14, 8, 1),
(15, 9, 4),
(16, 11, 2),
(17, 13, 3),
(18, 14, 1),
(19, 16, 2),
(20, 17, 4),
(21, 19, 2),
(22, 21, 3),
(23, 23, 1),
(24, 24, 2),
(25, 1, 5);

-- Insert AI Preferences
INSERT INTO AIPreferences (Customer_ID, Product_Type_Preferences, Allergies, Purchase_History) 
VALUES 
(1, 'Beverage', 'None', 'Organic Coffee'),
(2, 'Home Decor', 'None', 'Scented Candle'),
(3, 'Electronics', 'None', 'Wireless Earbuds'),
(4, 'Food', 'Peanuts', 'Luxury Chocolate Box'),
(5, 'Fashion Accessories', 'None', 'Leather Wallet'),
(6, 'Beauty & Personal Care', 'None', 'Handmade Soap'),
(7, 'Fitness', 'Dairy', ' Fitness Resistance Bands'),
(8, 'Health & Nutrition', 'None', 'Protein Powder'),
(9, 'Beauty & Personal Care', 'None', 'Essential Oil Set'),
(10, 'Beverage', 'Soy', 'Organic Coffee'),
(11, 'Fashion Accessories', 'None', 'Silk Scarf'),
(12, 'Fitness', 'None', 'Stainless Steel Water Bottle'),
(13, 'Beauty & Personal Care', 'None', 'Face Serum'),
(14, 'Electronics', 'None', 'Gaming Mouse'),
(15, 'Fashion Accessories', 'None', 'Handwoven Jute Bag'),
(16, 'Fitness', 'None', 'Yoga Mat'),
(17, 'Home Decor', 'None', 'Wooden Photo Frame'),
(18, 'Health & Nutrition', 'Gluten', 'Green Tea Extract'),
(19, 'Food', 'None', 'Organic Honey'),
(20, 'Electronics', 'None', 'Bluetooth Speaker'),
(21, 'Beverage', 'None', 'Organic Coffee'),
(22, 'Fashion Accessories', 'Nuts', 'Silk Scarf'),
(23, 'Electronics', 'Lactose', 'Smart Watch'),
(24, 'Beauty & Personal Care', 'None', 'Handmade Soap'),
(25, 'Food', 'None', 'Organic Honey');

-- Insert suppliers
INSERT INTO Suppliers (Supplier_Name, Contact_Details) 
VALUES 
('Global Beverages Ltd.', 'Email: info@globalbeverages.com'),
('Lux Decor Enterprises', 'Email: contact@luxdecor.com'),
('SmartTech Innovations', 'Email: sales@smarttech.com'),
('FitLife Supplies', 'Email: support@fitlife.com'),
('Fresh Foods Distributors', 'Email: contact@freshfoods.com'),
('Essence Beauty Ltd.', 'Email: info@essencebeauty.com'),
('TechGizmo Traders', 'Email: sales@techgizmo.com'),
('Aromas Home Decor', 'Email: support@aromashome.com'),
('Handmade Essentials Pvt. Ltd.', 'Email: orders@handmadeessentials.com'),
('ChocoDelight International', 'Email: hello@chocodelight.com');

-- Insert Payments 
INSERT INTO Payments (Customer_ID, Amount, Transaction_Date, Payment_Method) 
VALUES 
(1, 29.99, '2025-02-05 10:00:00', 'Credit Card'),
(2, 9.99, '2025-02-07 11:15:00', 'Debit Card'),
(3, 79.99, '2025-02-02 14:30:00', 'PayPal'),
(4, 199.99, '2025-02-06 16:45:00', 'Bank Transfer'),
(5, 59.99, '2025-02-10 09:00:00', 'Credit Card'),
(6, 39.99, '2025-01-30 12:10:00', 'Debit Card'),
(7, 89.99, '2025-02-08 13:25:00', 'PayPal'),
(8, 9.99, '2025-02-12 17:50:00', 'Credit Card'),
(9, 29.99, '2025-02-04 10:30:00', 'Debit Card'),
(10, 79.99, '2025-02-01 18:00:00', 'PayPal'),
(11, 199.99, '2025-02-09 08:45:00', 'Bank Transfer'),
(12, 59.99, '2025-02-15 14:20:00', 'Credit Card'),
(13, 39.99, '2025-01-28 11:35:00', 'Debit Card'),
(14, 89.99, '2025-02-03 15:55:00', 'PayPal'),
(15, 9.99, '2025-02-11 12:05:00', 'Credit Card'),
(16, 29.99, '2025-02-05 13:00:00', 'Debit Card'),
(17, 79.99, '2025-02-02 10:10:00', 'PayPal'),
(18, 199.99, '2025-02-07 11:20:00', 'Bank Transfer'),
(19, 59.99, '2025-02-14 14:00:00', 'Credit Card'),
(20, 39.99, '2025-01-29 12:50:00', 'Debit Card'),
(21, 89.99, '2025-02-06 10:15:00', 'PayPal'),
(22, 9.99, '2025-02-13 13:40:00', 'Credit Card'),
(23, 29.99, '2025-02-04 11:10:00', 'Debit Card'),
(24, 79.99, '2025-02-02 16:25:00', 'PayPal'),
(25, 199.99, '2025-02-08 09:30:00', 'Bank Transfer');

-- Checking for First Normal Form (1NF) Violations
-- 1. Check for comma-separated or multiple values in any column (atomicity violations)
SELECT Customer_ID, Name FROM Customers WHERE Name LIKE '%,%'; 
SELECT Plan_ID, Plan_Name FROM SubscriptionPlans WHERE Plan_Name LIKE '%,%'; 
SELECT Order_ID, Order_Status FROM Orders WHERE Order_Status LIKE '%,%'; 
SELECT Product_ID, Product_Name FROM ProductInventory WHERE Product_Name LIKE '%,%'; 
SELECT Preference_ID, Product_Type_Preferences FROM AIPreferences WHERE Product_Type_Preferences LIKE '%,%';
SELECT Preference_ID, Allergies FROM AIPreferences WHERE Allergies LIKE '%,%';
SELECT Preference_ID, Purchase_History FROM AIPreferences WHERE Purchase_History LIKE '%,%';

-- no column in any table contains multiple values separated by comma, so, 1NF is not violated. 
-- 2. Check for duplicate values in unique columns (e.g., Email in Customers)
SELECT Email, COUNT(*) FROM Customers GROUP BY Email HAVING COUNT(*) > 1;

-- 3. Check if any numeric fields contain non-numeric values (ensuring data integrity)
SELECT Pricing FROM SubscriptionPlans WHERE Pricing REGEXP '[^0-9.]';  
SELECT Stock_Level FROM ProductInventory WHERE Stock_Level REGEXP '[^0-9]';  
SELECT Amount FROM Payments WHERE Amount REGEXP '[^0-9.]';  

-- 4. Check if OrderDetails has duplicate Order_ID-Product_ID pairs (should be unique)
SELECT Order_ID, Product_ID, COUNT(*) FROM OrderDetails GROUP BY Order_ID, Product_ID HAVING COUNT(*) > 1;

-- 5. Check if dates are stored correctly (Order Dispatch Dates & Payment Transactions)
SELECT Dispatch_Date FROM Orders WHERE Dispatch_Date REGEXP '[^0-9-]';
SELECT Transaction_Date FROM Payments WHERE Transaction_Date REGEXP '[^0-9- :]';

-- 6. Check for missing primary keys 
SELECT * FROM Customers WHERE Customer_ID IS NULL;
SELECT * FROM SubscriptionPlans WHERE Plan_ID IS NULL;
SELECT * FROM Orders WHERE Order_ID IS NULL;
SELECT * FROM ProductInventory WHERE Product_ID IS NULL;
SELECT * FROM OrderDetails WHERE OrderDetail_ID IS NULL;
SELECT * FROM AIPreferences WHERE Preference_ID IS NULL;
SELECT * FROM Suppliers WHERE Supplier_ID IS NULL;
SELECT * FROM Payments WHERE Payment_ID IS NULL;
-- There are no tables with missing primary keys, so, 1NF is not violated.

-- As, all checks for 1NF found that, 1NF is not violated, hence we can conclude that our database - Hyper-Personalized Subscription Box - is 1NF compliant.

-- 2. Stress Testing 

-- 1. Insert New Records (Stress Test on INSERT)
-- Insert a new customer
INSERT INTO Customers (Name, Email, Address, Subscription_Tier) 
VALUES ('Rajesh Kumar', 'rajesh.kumar@test.com', '456 New Street, Pune', 'Gold');

-- Insert a new subscription plan
INSERT INTO SubscriptionPlans (Plan_Name, Pricing, Frequency) 
VALUES ('Exclusive Luxury Box', 149.99, 'Yearly');

-- Insert a new product
INSERT INTO ProductInventory (Product_Name, Category, Stock_Level) 
VALUES ('Premium Skincare Kit', 'Beauty & Personal Care', 100);

-- Insert a new order
INSERT INTO Orders (Customer_ID, Plan_ID, Order_Status, Dispatch_Date) 
VALUES (1, 1, 'Pending', '2025-02-10');

-- Insert a new payment
INSERT INTO Payments (Customer_ID, Amount, Transaction_Date, Payment_Method) 
VALUES (1, 149.99, '2025-02-10 12:30:00', 'Credit Card');

-- 2. Update Existing Records (Stress Test on UPDATE)

-- Update Customer Address
UPDATE Customers 
SET Address = '99 Updated Road, Delhi' 
WHERE Name = 'Rajesh Kumar';

-- Update Product Stock Level
UPDATE ProductInventory 
SET Stock_Level = Stock_Level - 5 
WHERE Product_Name = 'Premium Skincare Kit';

-- Update Subscription Plan Pricing
UPDATE SubscriptionPlans 
SET Pricing = 159.99 
WHERE Plan_Name = 'Exclusive Luxury Box';

-- Update Order Status
UPDATE Orders 
SET Order_Status = 'Shipped' 
WHERE Order_ID = 1;

-- Update Payment Method
UPDATE Payments 
SET Payment_Method = 'PayPal' 
WHERE Payment_ID = 1;

-- 3. Delete Records (Stress Test on DELETE)
-- Delete related Order Details first to prevent foreign key constraint errors
DELETE FROM OrderDetails WHERE Order_ID = (SELECT Order_ID FROM Orders WHERE Customer_ID = 1 LIMIT 1);

-- Delete Order
DELETE FROM Orders WHERE Customer_ID = 1;

-- Delete Payment
DELETE FROM Payments WHERE Customer_ID = 1;

-- Delete Customer
DELETE FROM Customers WHERE Name = 'Rajesh Kumar';

-- 4. Disable Foreign Key Checks for Forced Deletion (Use Caution)
SET FOREIGN_KEY_CHECKS = 0;

DELETE FROM Orders WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Name = 'Rajesh Kumar' LIMIT 1);
DELETE FROM Payments WHERE Customer_ID = (SELECT Customer_ID FROM Customers WHERE Name = 'Rajesh Kumar' LIMIT 1);
DELETE FROM Customers WHERE Name = 'Rajesh Kumar';

SET FOREIGN_KEY_CHECKS = 1;

-- 5. Measure Execution Time of Queries
-- Measure Execution Time of INSERT Query
SET @start_time = NOW();
INSERT INTO Orders (Customer_ID, Plan_ID, Order_Status, Dispatch_Date) 
VALUES (1, 1, 'Pending', NOW());
SELECT TIMEDIFF(NOW(), @start_time) AS InsertExecutionTime;

-- Measure Execution Time of UPDATE Query
SET @start_time = NOW();
UPDATE Orders SET Order_Status = 'Delivered' WHERE Order_ID = 1;
SELECT TIMEDIFF(NOW(), @start_time) AS UpdateExecutionTime;

-- Measure Execution Time of DELETE Query
SET @start_time = NOW();
DELETE FROM Orders WHERE Order_ID = 1;
SELECT TIMEDIFF(NOW(), @start_time) AS DeleteExecutionTime;

-- 3. Updation Queries

-- UPDATING EXISTING DATA

-- Updating a customer’s subscription tier
UPDATE Customers 
SET Subscription_Tier = 'Platinum' 
WHERE Name = 'Aarav Sharma';

-- Change a customer's email
UPDATE Customers 
SET Email = 'priya.verma.new@gmail.com' 
WHERE Email = 'priya.verma@eyahoo.com';

-- Update the pricing of a subscription plan
UPDATE SubscriptionPlans 
SET Pricing = 109.99 
WHERE Plan_Name = 'Platinum Box';

-- Change the frequency of a plan
UPDATE SubscriptionPlans 
SET Frequency = 'Yearly' 
WHERE Plan_Name = 'Tech Enthusiast Box';

-- Update an order status
UPDATE Orders 
SET Order_Status = 'Delivered' 
WHERE Order_ID = 5;

-- Change the dispatch date
UPDATE Orders 
SET Dispatch_Date = '2025-02-12' 
WHERE Order_ID = 10;

-- Increase stock level for a product
UPDATE ProductInventory 
SET Stock_Level = Stock_Level + 10 
WHERE Product_Name = 'Wireless Earbuds';

-- Change the category of a product
UPDATE ProductInventory 
SET Category = 'Luxury Food' 
WHERE Product_Name = 'Luxury Chocolate Box';

-- Update a customer’s allergies
UPDATE AIPreferences 
SET Allergies = 'Gluten' 
WHERE Customer_ID = 4;

-- Change a payment method
UPDATE Payments 
SET Payment_Method = 'PayPal' 
WHERE Payment_ID = 3;

-- Apply a Discount to Payments Above ₹500
UPDATE Payments 
SET Amount = Amount * 0.9 
WHERE Amount > 500;

-- Check updated records
SELECT * FROM Payments;

-- ADDING NEW DATA 
-- Add a new customer
INSERT INTO Customers (Name, Email, Address, Subscription_Tier) 
VALUES ('Nisha Gupta', 'nisha.gupta@example.com', '56 Jubilee Hills, Hyderabad', 'Gold');

-- Insert a new subscription plan
INSERT INTO SubscriptionPlans (Plan_Name, Pricing, Frequency) 
VALUES ('Eco-Friendly Box', 49.99, 'Monthly');

-- Add a new order
INSERT INTO Orders (Customer_ID, Plan_ID, Order_Status, Dispatch_Date) 
VALUES (3, 2, 'Pending', '2025-02-20');

-- Adding a CreatedAt timestamp column to relevant tables:
ALTER TABLE Customers 
ADD COLUMN CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE Orders 
ADD COLUMN CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
 
ALTER TABLE Payments 
ADD COLUMN CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- Alter the Orders Table to Add New Columns and insert data in the columns
ALTER TABLE Orders 
ADD COLUMN Estimated_Delivery_Date DATE,
ADD COLUMN Actual_Delivery_Date DATE;

UPDATE Orders 
SET Estimated_Delivery_Date = DATE_ADD(Dispatch_Date, INTERVAL 3 DAY);

UPDATE Orders 
SET Actual_Delivery_Date = 
    CASE 
        WHEN Order_Status = 'Delivered' THEN DATE_ADD(Dispatch_Date, INTERVAL FLOOR(RAND() * 4) + 2 DAY)
        ELSE NULL
    END;
    
-- Modifying data types for better precision:
ALTER TABLE SubscriptionPlans MODIFY COLUMN Pricing DECIMAL(18,2);
ALTER TABLE Payments MODIFY COLUMN Amount DECIMAL(18,2);

-- Adding NOT NULL constraints where necessary:
ALTER TABLE Customers MODIFY COLUMN Name VARCHAR(100) NOT NULL;
ALTER TABLE Customers MODIFY COLUMN Email VARCHAR(100) NOT NULL;
ALTER TABLE SubscriptionPlans MODIFY COLUMN Plan_Name VARCHAR(100) NOT NULL;
ALTER TABLE Orders MODIFY COLUMN Order_Status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL;
ALTER TABLE Payments MODIFY COLUMN Payment_Method ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer') NOT NULL;

-- Adding CHECK constraints for validation:
ALTER TABLE ProductInventory ADD CONSTRAINT chk_stock_level CHECK (Stock_Level >= 0);
ALTER TABLE Payments ADD CONSTRAINT chk_payment_amount CHECK (Amount > 0);

-- Add FOREIGN KEY constraints where missing:
ALTER TABLE Orders ADD CONSTRAINT fk_customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);
ALTER TABLE Orders ADD CONSTRAINT fk_plan FOREIGN KEY (Plan_ID) REFERENCES SubscriptionPlans(Plan_ID);
ALTER TABLE OrderDetails ADD CONSTRAINT fk_order FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID);
ALTER TABLE OrderDetails ADD CONSTRAINT fk_product FOREIGN KEY (Product_ID) REFERENCES ProductInventory(Product_ID);
ALTER TABLE AIPreferences ADD CONSTRAINT fk_ai_customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);
ALTER TABLE Payments ADD CONSTRAINT fk_payment_customer FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID);

-- 4. Retrieval and Analyse Queries

-- 1. Retrieve All Customer Details
USE ss_sr_SubscriptionBoxERP;
SELECT * FROM Customers;
-- Analysis:
-- This query fetches all customer records.
-- Useful for an overview of customer base.

-- 2. Retrieve Orders Along with Customer Details
SELECT Orders.Order_ID, Customers.Name, Customers.Email, Orders.Order_Status, Orders.Dispatch_Date
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID;
-- Analysis:
-- Joins the Orders and Customers tables.
-- Fetches customer name and email along with their order details.
-- Helps track orders by customer.

-- 3. Retrieve Orders with Subscription Plan Details
SELECT Orders.Order_ID, Customers.Name, SubscriptionPlans.Plan_Name, SubscriptionPlans.Pricing, Orders.Order_Status 
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
JOIN SubscriptionPlans ON Orders.Plan_ID = SubscriptionPlans.Plan_ID;
-- Analysis:
-- Joins three tables: Orders, Customers, and SubscriptionPlans.
-- Helps identify which customers have subscribed to which plans.

-- 4. Retrieve Top 5 Most Popular Subscription Plans (Based on Orders)
SELECT SubscriptionPlans.Plan_Name, COUNT(Orders.Order_ID) AS TotalOrders
FROM Orders
JOIN SubscriptionPlans ON Orders.Plan_ID = SubscriptionPlans.Plan_ID
GROUP BY SubscriptionPlans.Plan_Name
ORDER BY TotalOrders DESC
LIMIT 5;
-- Analysis:
-- Groups orders by subscription plan.
-- Counts the number of orders per plan.
-- Useful for determining the most popular subscription plans.

-- 5. Retrieve Products That Are Running Low on Stock
SELECT * FROM ProductInventory WHERE Stock_Level < 20;
-- Analysis:
-- Retrieves products where stock is below 20.
-- Helps with inventory management and restocking decisions.

-- 6. Retrieve Customers Who Have Ordered the Most
SELECT Customers.Name, COUNT(Orders.Order_ID) AS TotalOrders
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
GROUP BY Customers.Name
ORDER BY TotalOrders DESC
LIMIT 5;
-- Analysis:
-- Counts orders per customer.
-- Helps identify high-value customers.

-- 7. Retrieve Payment Transactions for a Specific Customer
SELECT Payments.Payment_ID, Customers.Name, Payments.Amount, Payments.Transaction_Date, Payments.Payment_Method
FROM Payments
JOIN Customers ON Payments.Customer_ID = Customers.Customer_ID
WHERE Customers.Name = 'Arjun Kapoor';
-- Analysis:
-- Filters payment records for a specific customer.
-- Useful for customer support and financial tracking.

-- 8. Retrieve Customers with AI Preferences Including Allergies
SELECT Customers.Name, AIPreferences.Product_Type_Preferences, AIPreferences.Allergies
FROM Customers
JOIN AIPreferences ON Customers.Customer_ID = AIPreferences.Customer_ID
WHERE AIPreferences.Allergies IS NOT NULL;
-- Analysis 
-- Fetches customers along with their AI preferences and allergies.
-- Helps in personalizing subscription box contents.

-- 9. Retrieve Monthly Revenue Summary
SELECT DATE_FORMAT(Transaction_Date, '%Y-%m') AS Month, SUM(Amount) AS TotalRevenue
FROM Payments
GROUP BY Month
ORDER BY Month DESC;
-- Analysis 
-- Summarizes revenue by month.
-- Useful for financial tracking and trend analysis.

-- 10. Retrieve List of Suppliers Providing Electronics
SELECT DISTINCT Suppliers.Supplier_Name
FROM Suppliers
JOIN ProductInventory ON ProductInventory.Category = 'Electronics';
-- Analysis:
-- Finds suppliers who provide electronic items.
-- Useful for supply chain management.

-- 11. Retrieve all Customers who have opted for a Gold Subscription Plan 
SELECT * FROM Customers WHERE Subscription_Tier = 'Gold';
-- Analysis:
-- This query helps identify customers who have opted for the Gold-tier subscription. It can be useful for targeted marketing campaigns or loyalty rewards.

-- 12. List all Orders along with Customer Names and their Status
SELECT Orders.Order_ID, Customers.Name, Orders.Order_Status, Orders.Dispatch_Date
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID;
-- Analysis:
-- It provides an overview of all orders, showing which customers have placed them and their current status (Pending, Shipped, Delivered, or Cancelled).

-- 13. Find the Total Revenue Generated from Each Subscription Plan
SELECT SubscriptionPlans.Plan_Name, SUM(Payments.Amount) AS Total_Revenue
FROM Payments
JOIN Orders ON Payments.Customer_ID = Orders.Customer_ID
JOIN SubscriptionPlans ON Orders.Plan_ID = SubscriptionPlans.Plan_ID
GROUP BY SubscriptionPlans.Plan_Name;
-- Analysis:
-- This query aggregates total revenue from each subscription plan, allowing businesses to see which plans are the most profitable.

-- 14. Retrieve Customers Who Have Made a Payment in the Last 30 Days
SELECT DISTINCT Customers.Name, Payments.Transaction_Date, Payments.Amount
FROM Customers
JOIN Payments ON Customers.Customer_ID = Payments.Customer_ID
WHERE Payments.Transaction_Date >= NOW() - INTERVAL 30 DAY;
-- Analysis
-- Identifies active customers who have recently made payments. This can help in customer engagement and service improvements.

-- 15. Retrieve Subscription Plans and the Number of Customers Subscribed
SELECT SubscriptionPlans.Plan_Name, COUNT(Orders.Customer_ID) AS Subscribers
FROM SubscriptionPlans
JOIN Orders ON SubscriptionPlans.Plan_ID = Orders.Plan_ID
GROUP BY SubscriptionPlans.Plan_Name
ORDER BY Subscribers DESC;
-- Analysis:
-- Shows which subscription plans have the highest number of subscribers, helping in decision-making for future marketing and product improvements.

-- 16. Find the Most Popular Products in Orders
SELECT ProductInventory.Product_Name, SUM(OrderDetails.Quantity) AS Total_Ordered
FROM OrderDetails
JOIN ProductInventory ON OrderDetails.Product_ID = ProductInventory.Product_ID
GROUP BY ProductInventory.Product_Name
ORDER BY Total_Ordered DESC
LIMIT 5;
-- Analysis
-- Identifies the top 5 most frequently ordered products, helping the business manage inventory and prioritize stock.

-- 17. Retrieve Orders with Product Details for a Specific Customer
SELECT Customers.Name, Orders.Order_ID, ProductInventory.Product_Name, OrderDetails.Quantity
FROM Customers
JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
JOIN OrderDetails ON Orders.Order_ID = OrderDetails.Order_ID
JOIN ProductInventory ON OrderDetails.Product_ID = ProductInventory.Product_ID
WHERE Customers.Name = 'Arjun Kapoor';
-- Analysis 
-- Analysis:
-- Fetches all orders placed by Arjun Kapoor, listing the products included in each order. This can help customer support teams provide better service.

-- 18. Retrieve Suppliers and the Products They Provide
SELECT Suppliers.Supplier_Name, ProductInventory.Product_Name
FROM Suppliers
JOIN ProductInventory ON ProductInventory.Category IN ('Beverage', 'Electronics', 'Fitness', 'Food');
-- Analysis
-- Links suppliers with their respective product categories, helping in procurement management.

-- 19. Retrieve Customers with Allergies Who Purchased Health & Nutrition Products
SELECT Customers.Name, AIPreferences.Allergies, AIPreferences.Product_Type_Preferences
FROM Customers
JOIN AIPreferences ON Customers.Customer_ID = AIPreferences.Customer_ID
WHERE AIPreferences.Allergies IS NOT NULL 
AND AIPreferences.Product_Type_Preferences LIKE '%Health & Nutrition%';
-- Analysis 
-- Identifies customers with allergies who have an interest in Health & Nutrition products. This can help in ensuring safer recommendations.

-- 20. Identifying Customers with the most Canceled Orders
SELECT Customers.Customer_ID, Customers.Name, 
       COUNT(Orders.Order_ID) AS Canceled_Orders
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
WHERE Orders.Order_Status = 'Canceled'
GROUP BY Customers.Customer_ID, Customers.Name
ORDER BY Canceled_Orders DESC;
-- Analysis 
-- This query identifies customers with the highest number of canceled orders.
-- Helps businesses find potential pain points—whether it's payment issues, shipping delays, or customer dissatisfaction.
-- If a particular customer cancels frequently, they may need special attention or support.

-- 21. Customer Purchase Frequency Analysis
SELECT Customers.Customer_ID, Customers.Name, COUNT(Orders.Order_ID) AS Total_Orders
FROM Customers
LEFT JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
GROUP BY Customers.Customer_ID, Customers.Name
ORDER BY Total_Orders DESC;
-- Analysis 
-- This query helps in identifying highly active customers by counting the number of orders they have placed.
-- Businesses can use this to reward loyal customers or target inactive ones for re-engagement.

-- 22. Identifying Delayed Shipments
SELECT Orders.Order_ID, Customers.Name, Orders.Dispatch_Date, Orders.Estimated_Delivery_Date, Orders.Actual_Delivery_Date,
       DATEDIFF(Orders.Actual_Delivery_Date, Orders.Estimated_Delivery_Date) AS Delay_Days
FROM Orders
JOIN Customers ON Orders.Customer_ID = Customers.Customer_ID
WHERE Orders.Actual_Delivery_Date > Orders.Estimated_Delivery_Date
ORDER BY Delay_Days DESC;
-- Analysis
-- Identifies which orders had delays and by how many days.
-- Useful for logistics optimization—repeated delays may indicate supplier issues or shipping inefficiencies.
-- Helps in customer support improvements, allowing the company to proactively notify customers.

-- 23. Identifying High-Value Customers (VIP Customers)
SELECT 
    Customers.Customer_ID, 
    Customers.Name, 
    SUM(SubscriptionPlans.Pricing) AS Total_Spent
FROM Customers
JOIN Orders ON Customers.Customer_ID = Orders.Customer_ID
JOIN SubscriptionPlans ON Orders.Plan_ID = SubscriptionPlans.Plan_ID
WHERE Orders.Order_Status = 'Delivered'
GROUP BY Customers.Customer_ID, Customers.Name
HAVING Total_Spent > 100
ORDER BY Total_Spent DESC;
-- Analysis
-- This query identifies top-spending customers based on subscription orders.
-- VIP customers can be targeted for loyalty programs, special discounts, or premium support.
