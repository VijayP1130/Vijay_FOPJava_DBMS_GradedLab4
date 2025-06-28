-- ========================================
-- E-COMMERCE DATABASE PROJECT SOLUTION
-- ========================================

-- Create Database
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- ========================================
-- 1. TABLE CREATION
-- ========================================

-- Create supplier table
CREATE TABLE supplier (
    SUPP_ID INT PRIMARY KEY,
    SUPP_NAME VARCHAR(50) NOT NULL,
    SUPP_CITY VARCHAR(50) NOT NULL,
    SUPP_PHONE VARCHAR(50) NOT NULL
);

-- Create customer table
CREATE TABLE customer (
    CUS_ID INT PRIMARY KEY,
    CUS_NAME VARCHAR(20) NOT NULL,
    CUS_PHONE VARCHAR(10) NOT NULL,
    CUS_CITY VARCHAR(30) NOT NULL,
    CUS_GENDER CHAR
);

-- Create category table
CREATE TABLE category (
    CAT_ID INT PRIMARY KEY,
    CAT_NAME VARCHAR(20) NOT NULL
);

-- Create product table
CREATE TABLE product (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(20) NOT NULL DEFAULT 'Dummy',
    PRO_DESC VARCHAR(60),
    CAT_ID INT,
    FOREIGN KEY (CAT_ID) REFERENCES category(CAT_ID)
);

-- Create supplier_pricing table
CREATE TABLE supplier_pricing (
    PRICING_ID INT PRIMARY KEY,
    PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT DEFAULT 0,
    FOREIGN KEY (PRO_ID) REFERENCES product(PRO_ID),
    FOREIGN KEY (SUPP_ID) REFERENCES supplier(SUPP_ID)
);

-- Create order table
CREATE TABLE `order` (
    ORD_ID INT PRIMARY KEY,
    ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    FOREIGN KEY (CUS_ID) REFERENCES customer(CUS_ID),
    FOREIGN KEY (PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

-- Create rating table
CREATE TABLE rating (
    RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    FOREIGN KEY (ORD_ID) REFERENCES `order`(ORD_ID)
);

-- ========================================
-- 2. DATA INSERTION
-- ========================================

-- Insert data into supplier table
INSERT INTO supplier VALUES
(1, 'Rajesh Retails', 'Delhi', '1234567890'),
(2, 'Appario Ltd.', 'Mumbai', '2589631470'),
(3, 'Knome products', 'Banglore', '9785462315'),
(4, 'Bansal Retails', 'Kochi', '8975463285'),
(5, 'Mittal Ltd.', 'Lucknow', '7898456532');

-- Insert data into customer table
INSERT INTO customer VALUES
(1, 'AAKASH', '9999999999', 'DELHI', 'M'),
(2, 'AMAN', '9785463215', 'NOIDA', 'M'),
(3, 'NEHA', '9999999999', 'MUMBAI', 'F'),
(4, 'MEGHA', '9994562399', 'KOLKATA', 'F'),
(5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

-- Insert data into category table
INSERT INTO category VALUES
(1, 'BOOKS'),
(2, 'GAMES'),
(3, 'GROCERIES'),
(4, 'ELECTRONICS'),
(5, 'CLOTHES');

-- Insert data into product table
INSERT INTO product VALUES
(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2),
(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5),
(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4),
(4, 'OATS', 'Highly Nutritious from Nestle', 3),
(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1),
(6, 'MILK', '1L Toned MIlk', 3),
(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4),
(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5),
(9, 'Project IGI', 'compatible with windows 7 and above', 2),
(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5),
(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1),
(12, 'Train Your Brain', 'By Shireen Stephen', 1);

-- Insert data into supplier_pricing table
INSERT INTO supplier_pricing VALUES
(1, 1, 2, 1500),
(2, 3, 5, 30000),
(3, 5, 1, 3000),
(4, 2, 3, 2500),
(5, 4, 1, 1000),
(6, 12, 2, 780),
(7, 12, 4, 789),
(8, 3, 1, 31000),
(9, 1, 5, 1450),
(10, 4, 2, 999),
(11, 7, 3, 549),
(12, 7, 4, 529),
(13, 6, 2, 105),
(14, 6, 1, 99),
(15, 2, 5, 2999),
(16, 5, 2, 2999);

-- Insert data into order table
INSERT INTO `order` VALUES
(101, 1500, '2021-10-06', 2, 1),
(102, 1000, '2021-10-12', 3, 5),
(103, 30000, '2021-09-16', 5, 2),
(104, 1500, '2021-10-05', 1, 1),
(105, 3000, '2021-08-16', 4, 3),
(106, 1450, '2021-08-18', 1, 9),
(107, 789, '2021-09-01', 3, 7),
(108, 780, '2021-09-07', 5, 6),
(109, 3000, '2021-09-10', 5, 3),
(110, 2500, '2021-09-10', 2, 4),
(111, 1000, '2021-09-15', 4, 5),
(112, 789, '2021-09-16', 4, 7),
(113, 31000, '2021-09-16', 1, 8),
(114, 1000, '2021-09-16', 3, 5),
(115, 3000, '2021-09-16', 5, 3),
(116, 99, '2021-09-17', 2, 14);

-- Insert data into rating table
INSERT INTO rating VALUES
(1, 101, 4),
(2, 102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);

-- ========================================
-- 3. QUERY SOLUTIONS
-- ========================================

-- Query 4: Display the total number of customers based on gender who have placed individual orders of worth at least Rs.3000
SELECT 
    c.CUS_GENDER AS Gender,
    COUNT(DISTINCT c.CUS_ID) AS Total_Customers
FROM customer c
JOIN `order` o ON c.CUS_ID = o.CUS_ID
WHERE o.ORD_AMOUNT >= 3000
GROUP BY c.CUS_GENDER;

-- Query 5: Display all the orders along with product name ordered by a customer having Customer_Id=2
SELECT 
    o.ORD_ID,
    o.ORD_AMOUNT,
    o.ORD_DATE,
    p.PRO_NAME AS Product_Name
FROM `order` o
JOIN supplier_pricing sp ON o.PRICING_ID = sp.PRICING_ID
JOIN product p ON sp.PRO_ID = p.PRO_ID
WHERE o.CUS_ID = 2;

-- Query 6: Display the Supplier details who can supply more than one product
SELECT 
    s.SUPP_ID,
    s.SUPP_NAME,
    s.SUPP_CITY,
    s.SUPP_PHONE,
    COUNT(DISTINCT sp.PRO_ID) AS Product_Count
FROM supplier s
JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
GROUP BY s.SUPP_ID, s.SUPP_NAME, s.SUPP_CITY, s.SUPP_PHONE
HAVING COUNT(DISTINCT sp.PRO_ID) > 1;

-- Query 7: Find the least expensive product from each category and print the table with category id, name, product name and price of the product
SELECT 
    c.CAT_ID,
    c.CAT_NAME,
    p.PRO_NAME,
    MIN(sp.SUPP_PRICE) AS Min_Price
FROM category c
JOIN product p ON c.CAT_ID = p.CAT_ID
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
WHERE sp.SUPP_PRICE = (
    SELECT MIN(sp2.SUPP_PRICE)
    FROM supplier_pricing sp2
    JOIN product p2 ON sp2.PRO_ID = p2.PRO_ID
    WHERE p2.CAT_ID = c.CAT_ID
)
GROUP BY c.CAT_ID, c.CAT_NAME, p.PRO_NAME;

-- Query 8: Display the Id and Name of the Product ordered after "2021-10-05"
SELECT DISTINCT 
    p.PRO_ID,
    p.PRO_NAME
FROM product p
JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
JOIN `order` o ON sp.PRICING_ID = o.PRICING_ID
WHERE o.ORD_DATE > '2021-10-05';

-- Query 9: Display customer name and gender whose names start or end with character 'A'
SELECT 
    CUS_NAME,
    CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';

-- Query 10: Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and Type_of_Service
DELIMITER //

CREATE PROCEDURE GetSupplierRatingAndService()
BEGIN
    SELECT 
        s.SUPP_ID,
        s.SUPP_NAME,
        ROUND(AVG(r.RAT_RATSTARS), 2) AS Average_Rating,
        CASE 
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM supplier s
    JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    JOIN `order` o ON sp.PRICING_ID = o.PRICING_ID
    JOIN rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID, s.SUPP_NAME
    ORDER BY s.SUPP_ID;
END //

DELIMITER ;

-- Execute the stored procedure
CALL GetSupplierRatingAndService();

-- ========================================
-- VERIFICATION QUERIES (Optional)
-- ========================================

-- Verify table structures
SHOW TABLES;

-- Check data counts
SELECT 'Supplier' as Table_Name, COUNT(*) as Row_Count FROM supplier
UNION ALL
SELECT 'Customer', COUNT(*) FROM customer
UNION ALL
SELECT 'Category', COUNT(*) FROM category
UNION ALL
SELECT 'Product', COUNT(*) FROM product
UNION ALL
SELECT 'Supplier_Pricing', COUNT(*) FROM supplier_pricing
UNION ALL
SELECT 'Order', COUNT(*) FROM `order`
UNION ALL
SELECT 'Rating', COUNT(*) FROM rating;

-- Sample data verification
SELECT * FROM supplier LIMIT 3;
SELECT * FROM customer LIMIT 3;
SELECT * FROM product LIMIT 3;
