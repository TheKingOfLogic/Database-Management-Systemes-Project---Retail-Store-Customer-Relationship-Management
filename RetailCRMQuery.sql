--Creating Database
CREATE DATABASE RetailCRM
GO

USE RetailCRM

--Creating Customers table
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100),
    PhoneNumber NVARCHAR(20),
    CreatedAt DATETIME DEFAULT GETDATE()
)

--Creating Products table
CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT NOT NULL
)

--Creating Orders table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

--Creating OrderDetails table (to track products in each order)
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)

-- 7. Creating Interactions table (to track customer interactions or feedback)
CREATE TABLE Interactions (
    InteractionID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    InteractionDate DATETIME DEFAULT GETDATE(),
    InteractionType NVARCHAR(50),  -- e.g., Call, Email, In-Store
    Notes NVARCHAR(255),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
)

USE RetailCRM

--Inserting Dummy Customers
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES
('John', 'Smith', 'john.smith@example.com', '0812345678'),
('Mary', 'Johnson', 'mary.johnson@example.com', '0823456789'),
('David', 'Brown', 'david.brown@example.com', '0834567890'),
('Linda', 'Davis', 'linda.davis@example.com', '0845678901'),
('Michael', 'Miller', 'michael.miller@example.com', '0856789012'),
('Susan', 'Wilson', 'susan.wilson@example.com', '0867890123'),
('Robert', 'Moore', 'robert.moore@example.com', '0878901234'),
('Patricia', 'Taylor', 'patricia.taylor@example.com', '0889012345'),
('James', 'Anderson', 'james.anderson@example.com', '0890123456'),
('Jennifer', 'Thomas', 'jennifer.thomas@example.com', '0801234567')

--Inserting Dummy Products
INSERT INTO Products (ProductName, Description, Price, StockQuantity)
VALUES
('Laptop', '15-inch gaming laptop', 1200.00, 10),
('Smartphone', 'Android smartphone 128GB', 700.00, 25),
('Headphones', 'Noise-cancelling headphones', 150.00, 40),
('Smartwatch', 'Fitness smartwatch', 200.00, 30),
('Keyboard', 'Mechanical keyboard', 80.00, 50),
('Mouse', 'Wireless mouse', 50.00, 60),
('Monitor', '24-inch LED monitor', 180.00, 20),
('Printer', 'All-in-one printer', 250.00, 15),
('Backpack', 'Laptop backpack', 60.00, 35),
('USB Drive', '64GB USB 3.0 drive', 25.00, 100)

--Inserting Dummy Orders
INSERT INTO Orders (CustomerID, TotalAmount)
VALUES
(1, 1350.00),
(2, 720.00),
(3, 180.00),
(4, 250.00),
(5, 1280.00),
(6, 200.00),
(7, 310.00),
(8, 110.00),
(9, 850.00),
(10, 75.00)

--Inserting Dummy OrderDetails
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price)
VALUES
-- Order 1
(1, 1, 1, 1200.00),
(1, 3, 1, 150.00),
-- Order 2
(2, 2, 1, 700.00),
(2, 10, 1, 20.00),
-- Order 3
(3, 3, 1, 150.00),
(3, 6, 1, 30.00),
-- Order 4
(4, 8, 1, 250.00),
-- Order 5
(5, 1, 1, 1200.00),
(5, 5, 1, 80.00),
-- Order 6
(6, 4, 1, 200.00),
-- Order 7
(7, 7, 1, 180.00),
(7, 6, 1, 130.00),
-- Order 8
(8, 5, 1, 80.00),
(8, 10, 1, 30.00),
-- Order 9
(9, 1, 1, 700.00),
(9, 4, 1, 150.00),
-- Order 10
(10, 10, 3, 25.00)

--Inserting Dummy Interactions
INSERT INTO Interactions (CustomerID, InteractionType, Notes)
VALUES
(1, 'Email', 'Asked about product warranty.'),
(2, 'Call', 'Inquired about delivery times.'),
(3, 'In-Store', 'Provided feedback on headphones.'),
(4, 'Email', 'Requested invoice for purchase.'),
(5, 'Call', 'Asked about discounts on laptops.'),
(6, 'In-Store', 'Tried on smartwatches.'),
(7, 'Email', 'Reported a defective monitor.'),
(8, 'Call', 'Asked for a product recommendation.'),
(9, 'In-Store', 'Bought additional accessories.'),
(10, 'Email', 'Subscribed to newsletter.')

--My Database Structure
--List all tables
SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'

--List columns of a table
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customers'


