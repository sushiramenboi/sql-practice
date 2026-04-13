-- Filter → Match → Clean → Sort

-- WHERE     = filter data
-- IN        = match list
-- BETWEEN   = match range
-- LIKE      = match pattern
-- DISTINCT  = remove duplicates
-- ORDER BY  = organize output


-- ============================================
-- SQL Operators & Clauses - Full Summary
-- ============================================

-- 1. CREATE TABLE with constraint (CHECK + IN)
CREATE TABLE Movie (
  ID INT AUTO_INCREMENT,                         -- Unique ID (auto increments)
  Title VARCHAR(100),                            -- Movie title (text)
  Rating CHAR(5) CHECK (Rating IN ('G','PG','PG-13','R')), -- Only allow specific ratings
  ReleaseDate DATE,                              -- Date format (YYYY-MM-DD)
  PRIMARY KEY (ID)                               -- Set ID as primary key
);

-- ============================================

-- 2. INSERT DATA
INSERT INTO Movie (Title, Rating, ReleaseDate) VALUES
('Rogue One: A Star Wars Story', 'PG-13', '2016-12-16'),
('Star Trek', 'PG-13', '2009-05-08'),
('The Dark Knight', 'PG-13', '2008-07-18'),
('Stargate', 'PG-13', '1994-10-28'),
('Avengers: Endgame', 'PG-13', '2019-04-26');

-- ============================================

-- 3. IN Operator (match multiple values)
SELECT *
FROM Movie
WHERE Rating IN ('PG', 'PG-13');   -- Same as multiple OR conditions

-- ============================================

-- 4. NOT IN (⚠️ avoid NULL issues)
SELECT *
FROM Movie
WHERE Rating NOT IN ('G', 'PG');   -- Excludes specific values

-- IMPORTANT:
-- If NULL exists → NOT IN can return no rows
-- Always combine with:
-- AND Rating IS NOT NULL

-- ============================================

-- 5. BETWEEN (range filter, inclusive)
SELECT *
FROM Movie
WHERE ReleaseDate BETWEEN '2000-01-01' AND '2020-01-01';
-- Same as:
-- ReleaseDate >= '2000-01-01' AND ReleaseDate <= '2020-01-01'

-- ============================================

-- 6. LIKE (pattern matching)

-- Starts with 's'
SELECT *
FROM Movie
WHERE Title LIKE 's%';

-- Ends with 'Knight'
SELECT *
FROM Movie
WHERE Title LIKE '%Knight';

-- Contains 'Star'
SELECT *
FROM Movie
WHERE Title LIKE '%Star%';

-- Exactly one character wildcard
SELECT *
FROM Movie
WHERE Title LIKE '_tar%';  -- Matches 'Star...' but not 'Sttar...'

-- Pattern: m + one char + o
SELECT *
FROM Movie
WHERE Title LIKE '%m_o%';

-- Case-sensitive match
SELECT *
FROM Movie
WHERE Title LIKE BINARY '%E%';

-- ============================================

-- 7. DISTINCT (remove duplicates)

-- Unique ratings only
SELECT DISTINCT Rating
FROM Movie;

-- DISTINCT with multiple columns (removes duplicate combinations)
SELECT DISTINCT Rating, ReleaseDate
FROM Movie;

-- ============================================

-- 8. ORDER BY (sorting results)

-- Ascending (default)
SELECT *
FROM Movie
ORDER BY Title;

-- Descending
SELECT *
FROM Movie
ORDER BY Title DESC;

-- Multi-column sorting
SELECT *
FROM Movie
ORDER BY Rating, Title;
-- First group by Rating, then sort Title within each group

-- ============================================

-- 9. COMBINED EXAMPLE (real-world style)

SELECT DISTINCT Title
FROM Movie
WHERE Rating IN ('PG-13')                  -- Filter values
  AND ReleaseDate BETWEEN '2000-01-01' AND '2020-01-01' -- Range filter
  AND Title LIKE 'S%'                      -- Pattern match
ORDER BY Title ASC;                        -- Sort results

-- ============================================

-- 🔥 KEY TAKEAWAYS:
-- IN        = match multiple values
-- NOT IN    = exclude values (⚠️ avoid NULL)
-- BETWEEN   = range (inclusive)
-- LIKE      = pattern matching (% = many, _ = one)
-- DISTINCT  = remove duplicates
-- ORDER BY  = sort results

-- SQL FLOW:
-- SELECT → FROM → WHERE → DISTINCT → ORDER BY