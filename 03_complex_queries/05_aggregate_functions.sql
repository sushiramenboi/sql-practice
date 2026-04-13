-- =========================================
-- 🔹 BASIC AGGREGATE FUNCTIONS
-- =========================================

-- Count all rows
SELECT COUNT(*) FROM TableName;

-- Find minimum, maximum, and average
SELECT 
  MIN(column_name),
  MAX(column_name),
  AVG(column_name)
FROM TableName;

-- Sum values
SELECT SUM(column_name) FROM TableName;



-- =========================================
-- 🔹 GROUP BY (Summarizing Data)
-- =========================================

-- Count rows per group
SELECT 
  Category,
  COUNT(*) AS total_count
FROM Product
GROUP BY Category;

-- Sum values per group
SELECT 
  CountryCode,
  SUM(Population) AS total_population
FROM City
GROUP BY CountryCode;

-- Group by multiple columns (more detailed grouping)
SELECT 
  CountryCode,
  District,
  COUNT(*) AS city_count
FROM City
GROUP BY CountryCode, District;



-- =========================================
-- 🔹 HAVING (Filter GROUPED Data)
-- =========================================

-- Only show groups with more than 100 rows
SELECT 
  Category,
  COUNT(*)
FROM Product
GROUP BY Category
HAVING COUNT(*) > 100;

-- Filter groups based on SUM
SELECT 
  CountryCode,
  SUM(Population)
FROM City
GROUP BY CountryCode
HAVING SUM(Population) > 2300000;



-- =========================================
-- 🔹 ORDER BY (Sorting Results)
-- =========================================

-- Sort grouped results
SELECT 
  Make,
  COUNT(*) AS total
FROM Auto
GROUP BY Make
ORDER BY Make;

-- Sort by aggregate value
SELECT 
  Type,
  MAX(Price) AS max_price
FROM Auto
GROUP BY Type
ORDER BY max_price;

-- Sort by multiple columns
SELECT 
  Year,
  Type,
  MAX(Price) AS max_price
FROM Auto
GROUP BY Year, Type
ORDER BY Year, max_price;



-- =========================================
-- 🔹 IMPORTANT: SELECT vs ORDER BY
-- =========================================

-- SELECT → what to show
-- ORDER BY → how to sort

SELECT 
  Type,
  MAX(Price) AS max_price
FROM Auto
GROUP BY Type
ORDER BY max_price;



-- =========================================
-- 🔹 NULL HANDLING (CRITICAL CONCEPT)
-- =========================================

-- ❌ Row-level math (NULL breaks calculation)
SELECT SUM(Salary + Bonus) FROM Compensation;

-- ✅ Column-level aggregation (NULL ignored safely)
SELECT SUM(Salary) + SUM(Bonus) FROM Compensation;

-- ✅ Best practice: use COALESCE to replace NULL
SELECT SUM(Salary + COALESCE(Bonus, 0)) FROM Compensation;



-- =========================================
-- 🔹 ROW vs COLUMN AGGREGATION (IMPORTANT)
-- =========================================

-- ❌ Row-level first → NULL can remove rows
SELECT MAX(Area1 + Area2) FROM Country;

-- ✅ Column-level first → NULL ignored
SELECT MAX(Area1) + MAX(Area2) FROM Country;



-- =========================================
-- 🔹 EXECUTION ORDER (MENTAL MODEL)
-- =========================================

-- SQL actually runs in this order:
-- FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY



-- =========================================
-- 🔹 KEY RULES SUMMARY
-- =========================================

-- 1. GROUP BY → creates groups
-- 2. Aggregate functions → calculate per group
-- 3. HAVING → filters groups (not rows)
-- 4. WHERE → filters rows (before grouping)
-- 5. ORDER BY → sorts final results
-- 6. NULL + anything = NULL
-- 7. Aggregates ignore NULL (except COUNT(*))
-- 8. SUM(A + B) ≠ SUM(A) + SUM(B)
-- 9. MAX(A + B) ≠ MAX(A) + MAX(B)