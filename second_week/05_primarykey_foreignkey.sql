-- =========================================
-- 1) PRIMARY KEY (single-column uniqueness)
-- Use PRIMARY KEY when one column must uniquely identify each row
-- and cannot be NULL.
-- =========================================
DROP TABLE IF EXISTS Student;

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL
);


-- =========================================
-- 2) COMPOSITE KEY (multi-column uniqueness)
-- Use a composite key when one column alone is not unique,
-- but the combination of two or more columns is unique.
-- =========================================
DROP TABLE IF EXISTS Enrollment;

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    EnrolledOn DATE,
    PRIMARY KEY (StudentID, CourseID)
);


-- =========================================
-- 3) FOREIGN KEY (table relationship)
-- Use FOREIGN KEY to link rows in a child table to valid rows
-- in a parent table, preserving referential integrity.
-- =========================================
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(60) NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-- =========================================
-- 4) AUTO_INCREMENT (automatic ID generation)
-- Use AUTO_INCREMENT to let MySQL assign the next numeric ID
-- automatically when inserting new rows.
-- =========================================
DROP TABLE IF EXISTS Ticket;

CREATE TABLE Ticket (
    TicketID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL
);

INSERT INTO Ticket (Title)
VALUES ('Printer issue'), ('Login issue');


-- =========================================
-- 5) INSERT (column/value matching rules)
-- If you do not list column names, values must match the full table order.
-- Best practice: list columns explicitly to avoid mistakes.
-- =========================================
DROP TABLE IF EXISTS EmployeeInsertDemo;

CREATE TABLE EmployeeInsertDemo (
    ID INT,
    Name VARCHAR(60),
    Salary DECIMAL(8,2)
);

-- Preferred: specify columns
INSERT INTO EmployeeInsertDemo (ID, Name, Salary)
VALUES (1, 'Ana', 65000.00);

-- Also valid: include all columns in table order
INSERT INTO EmployeeInsertDemo
VALUES (2, 'Ben', 58000.00);

-- Invalid example (column count mismatch):
-- INSERT INTO EmployeeInsertDemo VALUES (3, 'Chris');


-- =========================================
-- 6) UNSIGNED (no negative numbers)
-- Use UNSIGNED for numeric fields that should never be negative
-- (for example: quantity, age, or stock count).
-- =========================================
DROP TABLE IF EXISTS Inventory;

CREATE TABLE Inventory (
    ProductID INT PRIMARY KEY,
    Quantity INT UNSIGNED
);

INSERT INTO Inventory (ProductID, Quantity)
VALUES (101, 25);

-- Invalid example (negative value):
-- INSERT INTO Inventory (ProductID, Quantity) VALUES (102, -5);