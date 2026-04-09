-- please note

-- NULL = unknown (not 0, not empty)

-- Any comparison with NULL → NULL
-- Any arithmetic with NULL → NULL

-- WHERE only returns TRUE
-- FALSE and NULL are excluded

-- Use:
IS NULL
IS NOT NULL

-- Handle NULL carefully or it will silently remove rows




/* =========================================================
   1. CREATE TABLE + SAMPLE DATA
   ========================================================= */

-- Drop table if it already exists
DROP TABLE IF EXISTS Song;

-- Create Song table
CREATE TABLE Song (
  ID INT,
  Title VARCHAR(60),
  Artist VARCHAR(60),
  ReleaseYear INT
);

-- Insert sample data with NULL values
INSERT INTO Song VALUES
  (100, 'Hey Jude', NULL, 1968),
  (200, 'When Doves Cry', 'Prince', 1984),
  (300, NULL, 'The Righteous Brothers', 1964),
  (400, 'Johnny B. Goode', 'Chuck Berry', 1958),
  (500, 'Smells Like Teen Spirit', NULL, 1991),
  (600, NULL, 'Aretha Franklin', 1967);



/* =========================================================
   2. SELECTING NULL VALUES (IS NULL)
   ========================================================= */

-- Select rows where Artist is missing (NULL)
SELECT *
FROM Song
WHERE Artist IS NULL;

-- Explanation:
-- IS NULL checks if a column has no value
-- Returns TRUE only when value is NULL



/* =========================================================
   3. SELECTING NON-NULL VALUES (IS NOT NULL)
   ========================================================= */

-- Select rows where Artist has a value
SELECT *
FROM Song
WHERE Artist IS NOT NULL;

-- Explanation:
-- IS NOT NULL returns TRUE when value exists



/* =========================================================
   4. NULL WITH OR LOGIC
   ========================================================= */

-- Select rows where Title OR Artist is NULL
SELECT *
FROM Song
WHERE Title IS NULL OR Artist IS NULL;

-- Explanation:
-- OR returns TRUE if at least one condition is TRUE
-- TRUE OR anything = TRUE
-- This finds rows where ANY column is missing



/* =========================================================
   5. NULL WITH AND LOGIC (IMPORTANT)
   ========================================================= */

-- Example structure:
SELECT *
FROM Song
WHERE Title IS NULL AND Artist IS NULL;

-- Explanation:
-- AND requires BOTH conditions to be TRUE
-- Only rows where BOTH Title AND Artist are NULL will be returned



/* =========================================================
   6. COMMON MISTAKE (NEVER DO THIS)
   ========================================================= */

-- ❌ This will NOT work
SELECT *
FROM Song
WHERE Artist = NULL;

-- Explanation:
-- Any comparison with NULL returns NULL (not TRUE)
-- WHERE only returns TRUE → so no rows are returned



/* =========================================================
   7. NULL IN ARITHMETIC EXPRESSIONS
   ========================================================= */

-- Example table: Compensation
SELECT Name
FROM Compensation
WHERE (Salary + Bonus) > 30000;

-- Explanation:
-- If Bonus is NULL → Salary + NULL = NULL
-- NULL > 30000 → NULL → row excluded



/* =========================================================
   8. NULL IN LOGICAL EXPRESSIONS (3-VALUED LOGIC)
   ========================================================= */

-- SQL uses:
-- TRUE, FALSE, NULL (unknown)

-- Examples:
-- TRUE AND NULL = NULL
-- FALSE AND NULL = FALSE
-- TRUE OR NULL = TRUE
-- FALSE OR NULL = NULL
-- NOT NULL = NULL

-- Explanation:
-- NULL represents "unknown"
-- Unknown stays unknown unless proven TRUE or FALSE



/* =========================================================
   9. WHERE CLAUSE RULE (CRITICAL)
   ========================================================= */

-- WHERE only returns rows where condition = TRUE

-- Results:
-- TRUE → included
-- FALSE → excluded
-- NULL → excluded



/* =========================================================
   10. REAL EXAMPLE (COMPLEX LOGIC)
   ========================================================= */

SELECT Name
FROM Compensation
WHERE NOT (Salary > 30000 AND Bonus > 1000);

-- Explanation:
-- TRUE AND NULL → NULL
-- NOT NULL → NULL
-- NULL is NOT TRUE → row excluded

-- Final result: possibly NO rows returned



/* =========================================================
   11. BEST PRACTICE (HANDLING NULL SAFELY)
   ========================================================= */

-- Replace NULL with default value using COALESCE
SELECT Name
FROM Compensation
WHERE (Salary + COALESCE(Bonus, 0)) > 30000;

-- Explanation:
-- NULL is replaced with 0
-- Prevents NULL from breaking calculations



/* =========================================================
   12. CORE RULES (REMEMBER THIS)
   ========================================================= */

-- NULL is NOT a value → it means "unknown"

-- NEVER use:
-- = NULL
-- != NULL

-- ALWAYS use:
-- IS NULL
-- IS NOT NULL

-- NULL spreads through expressions:
-- Any operation with NULL → NULL

-- WHERE only returns TRUE