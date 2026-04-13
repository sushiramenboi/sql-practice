-- =========================================================
-- 🧠 SQL FUNCTIONS CHEAT SHEET (Condensed)
-- Covers: Numeric, String, Date, Expression Logic
-- =========================================================


-- =========================================================
-- 🔢 NUMERIC FUNCTIONS
-- =========================================================

-- ABS() → makes number positive (distance from 0)
SELECT ABS(-5);  -- 5

-- SQRT() → square root
SELECT SQRT(25);  -- 5

-- ROUND(n, d) → round to d decimals
SELECT ROUND(16.25, 1);  -- 16.3

-- POW(x, y) → x raised to power y
SELECT POW(2, 3);  -- 8

-- RAND() → random number (0 to 1)
SELECT RAND();


-- 🔥 Expression structure (IMPORTANT)
-- Apply functions ONLY to what you intend

SELECT ABS(X) * SQRT(Y)
FROM Book;
-- ABS(X) → affects X only
-- SQRT(Y) → affects Y only
-- THEN multiply


-- =========================================================
-- 🔤 STRING FUNCTIONS
-- =========================================================

-- CONCAT() → combine strings
SELECT CONCAT('Super ', Name)
FROM Avatar;

-- LOWER() → lowercase
SELECT LOWER('MySQL');  -- 'mysql'

-- UPPER() → uppercase
SELECT UPPER('mysql');  -- 'MYSQL'

-- REPLACE() → replace text
SELECT REPLACE('This and that', 'and', 'or');
-- 'This or that'

-- SUBSTRING(string, start, length)
SELECT SUBSTRING('Boomerang', 1, 4);
-- 'Boom'
-- ⚠️ starts at 1, not 0

-- TRIM() → remove spaces
SELECT TRIM('   test   ');
-- 'test'


-- 🔥 Combine columns into one string
SELECT CONCAT(FirstName, ' ', LastName)
FROM Student;
-- Adds space between names


-- =========================================================
-- 📅 DATE FUNCTIONS
-- =========================================================

-- Current date/time
SELECT CURDATE();   -- date only
SELECT CURTIME();   -- time only
SELECT NOW();       -- full datetime

-- Extract date/time
SELECT DATE('2013-03-25 22:11:45');  -- date part
SELECT TIME('2013-03-25 22:11:45');  -- time part

-- Extract parts of date
SELECT YEAR('2016-10-25');   -- 2016
SELECT MONTH('2016-10-25');  -- 10
SELECT DAY('2016-10-25');    -- 25

-- Extract parts of time
SELECT HOUR('22:11:45');     -- 22
SELECT MINUTE('22:11:45');   -- 11
SELECT SECOND('22:11:45');   -- 45


-- 🔥 Real query: extract year from columns
SELECT YEAR(StartDate), YEAR(EndDate)
FROM Project;


-- =========================================================
-- 🧠 CONDITIONAL FILTERING (REAL USE)
-- =========================================================

-- After 2017 OR in November
SELECT *
FROM Movie
WHERE YEAR(ReleaseDate) > 2017
   OR MONTH(ReleaseDate) = 11;


-- =========================================================
-- 🔥 CORE MENTAL MODELS (MOST IMPORTANT)
-- =========================================================

-- 1. Functions only affect what's inside ()
-- ABS(X * Y) ≠ ABS(X) * Y

-- 2. Pick the right tool:
-- CONCAT → combine
-- SUBSTRING → extract
-- ABS → remove negative
-- SQRT → square root
-- YEAR/MONTH → extract date parts

-- 3. Build expressions in steps:
-- transform → then combine

-- 4. SQL reads left → right, but () controls logic

-- =========================================================
-- 🧠 TL;DR
-- =========================================================

-- Numeric → math operations
-- String → clean/format text
-- Date → extract/filter time data
-- Expressions → structure matters more than syntax















-- =========================================================
-- 🔢 ABS() → Absolute Value (VERY IMPORTANT)
-- =========================================================

-- 📌 Definition:
-- Returns the non-negative value of a number
-- Think: "distance from zero"

SELECT ABS(-5);   -- 5
SELECT ABS(5);    -- 5


-- =========================================================
-- 🔥 BASIC USAGE
-- =========================================================

-- Difference between two values (ignores sign)
SELECT ABS(X - Y)
FROM Numbers;
-- Example:
-- 3 - 10 = -7 → ABS(-7) = 7


-- =========================================================
-- 🔥 COMPARISON / DIFFERENCE (MOST COMMON USE)
-- =========================================================

-- Find how far apart two values are
SELECT X, Y, ABS(X - Y) AS Difference
FROM Numbers;

-- 👉 Used when direction doesn't matter, only magnitude


-- =========================================================
-- 🔥 FILTERING WITH ABS (VERY POWERFUL)
-- =========================================================

-- Find rows where difference is large
SELECT *
FROM Numbers
WHERE ABS(X - Y) > 5;

-- 👉 Detects anomalies / mismatches


-- =========================================================
-- 🔥 SORTING BY CLOSENESS
-- =========================================================

-- Find closest value to a target (e.g., 100)
SELECT *
FROM Products
ORDER BY ABS(Price - 100);

-- 👉 Smallest difference = closest match


-- =========================================================
-- 🔥 REAL-WORLD QA / DATA VALIDATION
-- =========================================================

-- Detect incorrect calculations (EX: age mismatch)
SELECT *
FROM Records
WHERE ABS(ExpectedValue - ActualValue) > 1;

-- 👉 Flags bad data, typos, system errors


-- =========================================================
-- 🔥 EXPRESSION STRUCTURE (COMMON MISTAKE)
-- =========================================================

-- ❌ WRONG (changes meaning)
SELECT ABS(X * SQRT(Y))
FROM Book;

-- Applies ABS to the whole result


-- ✅ CORRECT (what problem wanted)
SELECT ABS(X) * SQRT(Y)
FROM Book;

-- Applies ABS to X only


-- =========================================================
-- 🧠 MENTAL MODEL
-- =========================================================

-- ABS() = "how far is this from zero?"
-- NOT: "is this positive or negative?"

-- Examples:
-- ABS(-10) = 10
-- ABS(10)  = 10

-- Distance is the same either way