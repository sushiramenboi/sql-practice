-- ================================
-- BASIC SELECT
-- ================================

-- Get all columns from table
SELECT *
FROM table_name;

-- Get specific columns
SELECT name, age
FROM table_name;


-- ================================
-- WHERE (FILTERING)
-- ================================

-- Filter with comparison
SELECT *
FROM table_name
WHERE age > 18;

-- Filter with AND (both must be TRUE)
SELECT *
FROM table_name
WHERE age > 18 AND salary < 100000;

-- Filter with OR (only one must be TRUE)
SELECT *
FROM table_name
WHERE age < 18 OR salary > 100000;

-- Range filtering
SELECT *
FROM table_name
WHERE percentage > 0 AND percentage < 10;


-- ================================
-- LIMIT (CONTROL ROW COUNT)
-- ================================

-- Limit number of rows
SELECT *
FROM table_name
LIMIT 10;

-- Limit with OFFSET (skip rows)
SELECT *
FROM table_name
LIMIT 10 OFFSET 10;

-- Get top values
SELECT *
FROM table_name
ORDER BY salary DESC
LIMIT 10;

-- Get lowest values
SELECT *
FROM table_name
ORDER BY salary ASC
LIMIT 10;

-- Get recent records
SELECT *
FROM table_name
ORDER BY created_at DESC
LIMIT 5;

-- Get random rows
SELECT *
FROM table_name
ORDER BY RAND()
LIMIT 5;


-- ================================
-- EXPRESSIONS & OPERATORS
-- ================================

-- Arithmetic
SELECT 10 + 2 * 5; -- precedence applies (* before +)

-- Comparison
SELECT *
FROM table_name
WHERE age != 18;

-- Logical
SELECT *
FROM table_name
WHERE NOT (age = 18);

-- Combined logic
SELECT *
FROM table_name
WHERE age > 18 AND (salary < 100000 OR department = 'HR');


-- ================================
-- TABLE CREATION & DATA
-- ================================

-- Drop table (⚠️ deletes table if exists)
DROP TABLE IF EXISTS Movie;

-- Create table with constraints
CREATE TABLE Movie (
  ID INT AUTO_INCREMENT,
  Title VARCHAR(100),
  Rating CHAR(5) CHECK (Rating IN ('G', 'PG', 'PG-13', 'R')),
  ReleaseDate DATE,
  PRIMARY KEY (ID)
);

-- Insert multiple rows
INSERT INTO Movie (Title, Rating, ReleaseDate) 
VALUES
  ('Casablanca', 'PG', '1943-01-23'),
  ('Bridget Jones Diary', 'PG-13', '2001-04-13'),
  ('The Dark Knight', 'PG-13', '2008-07-18'),
  ('Hidden Figures', 'PG', '2017-01-06'),
  ('Toy Story', 'G', '1995-11-22'),
  ('Rocky', 'PG', '1976-11-21'),
  ('Crazy Rich Asians', 'PG-13', '2018-08-15');

-- Filter real data
SELECT *
FROM Movie
WHERE ReleaseDate < '2000-01-01';