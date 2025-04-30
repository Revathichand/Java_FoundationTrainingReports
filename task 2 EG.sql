DROP DATABASE IF EXISTS TechShop;
CREATE DATABASE TechShop;
USE TechShop;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    Order_Count INT
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    Category VARCHAR(50),
    OtherDetails TEXT
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OtherInfo TEXT,
    Status VARCHAR(20),
    Total_Cost DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Amount DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Customers (CustomerID, Name, Email, Phone, Address, Order_Count) VALUES
(1, 'Revan', 'rev@gmail.com', '987654321', 'India', 0),
(2, 'Sab', 'sab@gmail.com', '98865643', 'Germany', 0);

INSERT INTO Products (ProductID, ProductName, Description, Price, Category, OtherDetails) VALUES
(1, 'Laptop', 'High-performance laptop', 85000, 'Electronic', '15 inch display'),
(2, 'Smartphone', 'Latest model smartphone', 76000, 'Electronic', '128GB storage');

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OtherInfo, Status, Total_Cost) VALUES
(1, 1, '2025-04-20', 'Urgent delivery', 'Pending', 0),
(2, 2, '2025-04-02', 'Standard delivery', 'Pending', 0);

INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, Amount) VALUES
(1, 1, 1, 2, 170000),
(2, 2, 2, 1, 76000);

INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate) VALUES
(1, 1, 50, '2025-04-10'),
(2, 2, 100, '2025-04-10');

SELECT Name, Email FROM Customers;

SELECT Orders.OrderID, Orders.OrderDate, Customers.Name
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

INSERT INTO Customers (CustomerID, Name, Email, Phone, Address, Order_Count)
VALUES (3, 'John Doe', 'john@example.com', '1234567890', '123 Main St', 0);

UPDATE Products
SET Price = Price * 1.10
WHERE Category = 'Electronic';

DELETE FROM OrderDetails WHERE OrderID = 1;
DELETE FROM Orders WHERE OrderID = 1;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OtherInfo, Status, Total_Cost)
VALUES (3, 2, '2025-04-30', 'Gift order', 'Pending', 0);

UPDATE Customers
SET Email = 'newemail@example.com', Address = 'New Address'
WHERE CustomerID = 2;

UPDATE Orders
SET Total_Cost = (
    SELECT SUM(Amount)
    FROM OrderDetails
    WHERE OrderDetails.OrderID = Orders.OrderID
);

DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 2);

DELETE FROM Orders
WHERE CustomerID = 2;

INSERT INTO Products (ProductID, ProductName, Description, Price, Category, OtherDetails)
VALUES (3, 'Smartphone X', 'Advanced model', 79999.99, 'Electronic', '64GB, Black');

UPDATE Orders
SET Status = 'Shipped'
WHERE OrderID = 2;

UPDATE Customers
SET Order_Count = (
    SELECT COUNT(*)
    FROM Orders
    WHERE Orders.CustomerID = Customers.CustomerID
);