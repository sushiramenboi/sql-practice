-- Safely remove table if it already exists (prevents errors)
DROP TABLE IF EXISTS Product;

-- Retrieve all data from Product table
SELECT *
FROM Product;

-- Example: Create table only if it doesn't already exist
CREATE TABLE IF NOT EXISTS City (
  ID INT,                     -- standard integer
  Name VARCHAR(50),           -- city name
  Population INT UNSIGNED     -- no negative population values
);


-- Example: Store file reference instead of BLOB (real-world approach)
CREATE TABLE Documents (
  ID INT,
  FileName VARCHAR(100),
  FileURL VARCHAR(255)        -- link to file stored outside database
);


-- Create Product table with appropriate data types
CREATE TABLE Product (
  ID SMALLINT UNSIGNED,        -- 0 to 65,535 (efficient storage for small IDs)
  Name VARCHAR(40),            -- variable-length text (max 40 chars)
  ProductType CHAR(3),         -- fixed-length text (always 3 chars like 'FOD')
  OriginDateTime DATETIME,     -- stores full date and time
  Weight FLOAT                 -- decimal values with ~4 bytes storage
);


-- Insert multiple rows into Product table
INSERT INTO Product (ID, Name, ProductType, OriginDateTime, Weight)
VALUES 
  (100, 'Tricorder', 'TC', '2020-08-11 10:30:00', 2.4),   -- lightweight device
  (200, 'Food replicator', 'FOD', '2020-09-21 14:15:00', 54.2), -- medium weight
  (300, 'Cloaking device', 'CD', '2019-02-04 08:00:00', 177.9); -- heavy device

-- Demonstrates good practices: constraints + data types
CREATE TABLE Employee (
  ID INT PRIMARY KEY,         -- unique identifier
  Name VARCHAR(60) NOT NULL,  -- required field
  BirthDate DATE,             -- date only
  Salary DECIMAL(10,2)        -- precise decimal (better than FLOAT for money)
);