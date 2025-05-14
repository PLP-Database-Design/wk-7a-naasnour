-- Submitted by: YOUR NAME
-- Week 7 Assignment: Database Design and Normalization

-- ==========================================================
-- QUESTION 1: Transform to First Normal Form (1NF)
-- ==========================================================

DROP TABLE IF EXISTS ProductDetail_1NF;

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product) VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- View Result
SELECT * FROM ProductDetail_1NF;

-- ==========================================================
-- QUESTION 2: Transform to Second Normal Form (2NF)
-- ==========================================================

DROP TABLE IF EXISTS OrderItems;
DROP TABLE IF EXISTS Orders;

-- Step 1: Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

INSERT INTO Orders (OrderID, CustomerName) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 2: Create OrderItems table
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO OrderItems (OrderID, Product, Quantity) VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);

-- View Results
SELECT * FROM Orders;
SELECT * FROM OrderItems;
