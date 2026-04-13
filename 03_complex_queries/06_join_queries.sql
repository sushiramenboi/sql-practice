
/*
========================================
SQL JOIN vs UNION — Summary
========================================

-- 👉 UNION is NOT a join.
-- It’s a way to stack results, not match rows.


JOIN:
- Used to connect related tables (e.g., Person ↔ CaseRecord)
- Combines data side-by-side (horizontal)
- Automatically handles matches and fills NULLs when no match (LEFT JOIN)

UNION:
- Used to combine results from multiple queries
- Stacks rows on top of each other (vertical)
- Does NOT match or relate tables

Key Insight:
- UNION can mimic a LEFT JOIN by combining:
  1. Matching rows
  2. Unmatched rows (with NULLs)
- But this is complex and not recommended in real-world usage

Real-World Practice:
- Normalize data into multiple tables
- Use JOIN for relationships
- Use UNION for reporting (combining datasets, sources, or match types)

Mental Model:
JOIN  = side-by-side (relationships)
UNION = top-to-bottom (combined results)

========================================
*/










-- ============================================
-- main module the basics
-- ============================================
-- =========================================================
-- 🔹 BASIC IDEA
-- JOIN = combine rows from two tables based on a match
-- =========================================================


-- =========================================================
-- 🔹 INNER JOIN (ONLY MATCHES)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
INNER JOIN Employee e
ON d.Manager = e.ID;

-- Explanation:
-- Only rows where d.Manager = e.ID will appear
-- If no match → row is removed
-- Example:
-- ❌ Tech Support (NULL manager) → removed
-- ❌ Employees with no department → removed


-- =========================================================
-- 🔹 LEFT JOIN (KEEP ALL LEFT TABLE)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
LEFT JOIN Employee e
ON d.Manager = e.ID;

-- Explanation:
-- Keep ALL rows from Department (left table)
-- If match → show both
-- If no match → e columns = NULL
-- Example:
-- ✔ Tech Support → NULL (no manager)


-- =========================================================
-- 🔹 RIGHT JOIN (KEEP ALL RIGHT TABLE)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
RIGHT JOIN Employee e
ON d.Manager = e.ID;

-- Explanation:
-- Keep ALL rows from Employee (right table)
-- If match → show both
-- If no match → d columns = NULL
-- Example:
-- ✔ Sam Snead → NULL (no department)


-- =========================================================
-- 🔹 FULL JOIN (KEEP EVERYTHING)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
FULL JOIN Employee e
ON d.Manager = e.ID;

-- Explanation:
-- Keep ALL rows from BOTH tables
-- Matching rows → combined
-- Unmatched left → right side = NULL
-- Unmatched right → left side = NULL

-- ⚠️ MySQL NOTE:
-- FULL JOIN is NOT supported in MySQL


-- =========================================================
-- 🔹 FULL JOIN WORKAROUND (MySQL)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
LEFT JOIN Employee e
ON d.Manager = e.ID

UNION

SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
RIGHT JOIN Employee e
ON d.Manager = e.ID;

-- Explanation:
-- Combines LEFT JOIN + RIGHT JOIN
-- Simulates FULL JOIN behavior


-- =========================================================
-- 🔹 PREFIXES (VERY IMPORTANT)
-- =========================================================
-- When tables share column names, specify table.column

SELECT d.Name, e.Name
FROM Department d
JOIN Employee e
ON d.Manager = e.ID;

-- Prevents ambiguity errors


-- =========================================================
-- 🔹 ALIASES (CLEAN OUTPUT)
-- =========================================================
SELECT d.Name AS Team,
       e.Name AS Supervisor
FROM Department d
JOIN Employee e
ON d.Manager = e.ID;

-- Renames columns in result for readability


-- =========================================================
-- 🔹 KEY TAKEAWAYS (MEMORY RULES)
-- =========================================================

-- INNER JOIN = only matches
-- LEFT JOIN  = keep left table no matter what
-- RIGHT JOIN = keep right table no matter what
-- FULL JOIN  = keep everything (not in MySQL)

-- NULL = no match found

-- JOIN structure:
-- FROM left_table
-- JOIN right_table
-- ON matching_condition
-- WHERE (optional filters)


-- =========================================================
-- 🔹 REAL WORLD (YOUR JOB ANALOGY)
-- =========================================================

-- People = left table
-- Records = right table

SELECT p.Name, r.Record
FROM People p
LEFT JOIN Records r
ON p.Name = r.Name;

-- Shows ALL people
-- If no record → NULL
-- This is how background checks work
























-- THIS IS THE TEST EXERCISE FROM THE MODULE
-- ============================================
-- RESET TABLES (so script can rerun cleanly)
-- ============================================
DROP TABLE IF EXISTS Artist, Artwork, Museum;


-- ============================================
-- STEP 3: FINAL TABLE STRUCTURE (IDs renamed)
-- ============================================

-- Artist table (stores artist info)
CREATE TABLE Artist (
  ID INT NOT NULL,              -- Primary key (was ArtistId)
  Name VARCHAR(45),            -- Artist name
  Birthplace VARCHAR(45),      -- Where artist is from
  PRIMARY KEY (ID)
);

-- Artwork table (stores artworks)
CREATE TABLE Artwork (
  ID INT NOT NULL,             -- Primary key (was ArtworkId)
  Title VARCHAR(45),           -- Artwork title
  Year INT,                    -- Year created
  ArtistId INT,                -- FK → Artist.ID
  MuseumId INT,                -- FK → Museum.ID
  PRIMARY KEY (ID)
);

-- Museum table (stores museum info)
CREATE TABLE Museum (
  ID INT NOT NULL,             -- Primary key (was MuseumId)
  Gallery VARCHAR(45),         -- Museum name
  City VARCHAR(45),            -- City location
  Country VARCHAR(45),         -- Country location
  PRIMARY KEY (ID)
);


-- ============================================
-- INSERT SAMPLE DATA
-- ============================================

-- Artists
INSERT INTO Artist VALUES
  (10, 'Leonardo da Vinci', 'Italy'),
  (20, 'Johannes Vermeer', 'Netherlands'),
  (30, 'Vincent van Gogh', 'Netherlands'),
  (40, 'Edvard Munch', 'Norway');

-- Museums
INSERT INTO Museum VALUES
  (100, 'Louvre Museum', 'Paris', 'France'),
  (200, 'Museum of Modern Art', 'New York City', 'United States'),
  (300, 'Basilica di Santa Maria delle Grazie', 'Milan', 'Italy'),
  (400, 'The National Gallery', 'Oslo', 'Norway'),
  (500, 'Mauritshuis', 'The Hague', 'Netherlands');

-- Artworks
INSERT INTO Artwork VALUES
  (101, 'The Last Supper', 1498, 10, 300),
  (102, 'Mona Lisa', 1503, 10, 100),
  (103, 'Girl with a Pearl Earring', 1665, 20, 500),
  (104, 'The Starry Night', 1889, 30, 200),
  (105, 'The Scream', 1893, 40, 400);


-- ============================================
-- STEP 1: FILTER + SORT + MORE COLUMNS
-- ============================================

-- Goal:
-- Show artist name, birthplace, artwork title, year, museum city
-- Only include titles starting with "The"
-- Sort by year

SELECT 
  Artist.Name,
  Artist.Birthplace,
  Artwork.Title,
  Artwork.Year,
  Museum.City
FROM Artist
INNER JOIN Artwork
  ON Artist.ID = Artwork.ArtistId      -- Match artist to artwork
INNER JOIN Museum
  ON Artwork.MuseumId = Museum.ID      -- Match artwork to museum
WHERE Artwork.Title LIKE 'The%'        -- Filter titles starting with "The"
ORDER BY Artwork.Year;                 -- Sort oldest → newest


-- ============================================
-- STEP 2: SHOW ALL IDS + DETAILS
-- ============================================

-- Goal:
-- Show IDs + names for all tables

SELECT 
  Artist.ID AS ArtistID,               -- Rename for clarity
  Artist.Name,
  Artwork.ID AS ArtworkID,
  Artwork.Title,
  Museum.ID AS MuseumID,
  Museum.Gallery
FROM Artist
INNER JOIN Artwork
  ON Artist.ID = Artwork.ArtistId
INNER JOIN Museum
  ON Artwork.MuseumId = Museum.ID;


-- ============================================
-- CORE CONCEPT SUMMARY (IMPORTANT)
-- ============================================

-- 1. INNER JOIN:
--    Combines rows ONLY when there is a match between tables

-- 2. JOIN FLOW:
--    Artist → Artwork → Museum
--    (who made it → what → where it is)

-- 3. WHERE:
--    Filters rows (LIKE 'The%' = starts with "The")

-- 4. ORDER BY:
--    Sorts results (ascending by default)

-- 5. COLUMN NAME COLLISION:
--    After renaming all IDs → must specify table (Artist.ID, etc.)

-- 6. ALIAS (AS):
--    Used to rename output columns for readability





























/*
========================================
JOIN TYPES USING UNION (Educational)
These mimic JOIN behavior manually
========================================
*/

--------------------------------------------------------
-- 1. INNER JOIN (No UNION needed)
--------------------------------------------------------

SELECT FacultyName, DepartmentName
FROM Faculty, Department
WHERE Faculty.Code = Department.Code;

/*
Explanation:
- Only returns matching rows
- Equivalent to INNER JOIN
*/


--------------------------------------------------------
-- 2. LEFT JOIN (Using UNION)
--------------------------------------------------------

-- Matching rows
SELECT FacultyName, DepartmentName
FROM Faculty, Department
WHERE Faculty.Code = Department.Code

UNION

-- Unmatched LEFT table rows (Faculty)
SELECT FacultyName, NULL
FROM Faculty
WHERE Faculty.Code IS NULL;

/*
Explanation:
- First query → matching rows
- Second query → unmatched Faculty rows
- NULL represents missing Department
*/


--------------------------------------------------------
-- 3. RIGHT JOIN (Using UNION)
--------------------------------------------------------

-- Matching rows
SELECT FacultyName, DepartmentName
FROM Faculty, Department
WHERE Faculty.Code = Department.Code

UNION

-- Unmatched RIGHT table rows (Department)
SELECT NULL, DepartmentName
FROM Department
WHERE Department.Code NOT IN (
  SELECT Code FROM Faculty WHERE Code IS NOT NULL
);

/*
Explanation:
- First query → matching rows
- Second query → unmatched Department rows
- NULL represents missing Faculty
*/


--------------------------------------------------------
-- 4. FULL JOIN (Using UNION)
--------------------------------------------------------

-- Matching rows
SELECT FacultyName, DepartmentName
FROM Faculty, Department
WHERE Faculty.Code = Department.Code

UNION

-- Unmatched LEFT rows (Faculty)
SELECT FacultyName, NULL
FROM Faculty
WHERE Faculty.Code IS NULL

UNION

-- Unmatched RIGHT rows (Department)
SELECT NULL, DepartmentName
FROM Department
WHERE Department.Code NOT IN (
  SELECT Code FROM Faculty WHERE Code IS NOT NULL
);

/*
Explanation:
- First query → matches
- Second → unmatched Faculty
- Third → unmatched Department
- UNION merges all into one result
*/


--------------------------------------------------------
-- NOTES
--------------------------------------------------------

/*
- These examples show how JOINs can be recreated manually
- NOT recommended in real-world use (too complex)

Use instead:
LEFT JOIN / RIGHT JOIN / FULL JOIN

Mental Model:
- JOIN → relates tables (side-by-side)
- UNION → stacks results (top-to-bottom)
*/








/*
========================================
SQL JOIN vs UNION — Practical Examples
(Real executable snippets + comments)
========================================
*/

-- Clean setup
DROP TABLE IF EXISTS Person, CaseRecord, Students, Teachers;

--------------------------------------------------------
-- 1. CREATE TABLES (Normalized Structure)
--------------------------------------------------------

-- Person table (one row per person)
CREATE TABLE Person (
  PersonID INT PRIMARY KEY,
  Name VARCHAR(50),
  DOB DATE,
  SSN VARCHAR(11)
);

-- CaseRecord table (one person → many cases)
CREATE TABLE CaseRecord (
  CaseID INT PRIMARY KEY,
  PersonID INT,
  Offense VARCHAR(100),
  Sentence VARCHAR(100)
);

--------------------------------------------------------
-- 2. INSERT SAMPLE DATA
--------------------------------------------------------

INSERT INTO Person VALUES
(1, 'John Doe', '1990-01-01', '123-45-6789'),
(2, 'Jane Smith', '1985-05-10', '987-65-4321'),
(3, 'Mike Ross', '1992-07-20', '111-22-3333');  -- No case (important)

INSERT INTO CaseRecord VALUES
(101, 1, 'Theft', '2 years probation'),
(102, 1, 'Fraud', '1 year jail'),
(103, 2, 'Assault', '3 years jail');

--------------------------------------------------------
-- 3. LEFT JOIN (REAL USE CASE)
--------------------------------------------------------

-- Combine Person + Case data
SELECT p.Name, p.DOB, c.Offense, c.Sentence
FROM Person p
LEFT JOIN CaseRecord c
ON p.PersonID = c.PersonID;

/*
Result:
- John → 2 rows (2 cases)
- Jane → 1 row
- Mike → shows NULL (no case)
*/

--------------------------------------------------------
-- 4. SAME RESULT USING UNION (MANUAL METHOD)
--------------------------------------------------------

-- Step 1: Matching rows (INNER JOIN behavior)
SELECT p.Name, p.DOB, c.Offense, c.Sentence
FROM Person p, CaseRecord c
WHERE p.PersonID = c.PersonID

UNION

-- Step 2: Unmatched rows (force NULL for missing case)
SELECT p.Name, p.DOB, NULL AS Offense, NULL AS Sentence
FROM Person p
WHERE p.PersonID NOT IN (
  SELECT PersonID FROM CaseRecord WHERE PersonID IS NOT NULL
);

/*
Result:
- Same as LEFT JOIN
- But manually built (not recommended)
*/

--------------------------------------------------------
-- 5. UNION — COMBINING DIFFERENT TABLES
--------------------------------------------------------

-- Create sample tables
CREATE TABLE Students (Name VARCHAR(50));
CREATE TABLE Teachers (Name VARCHAR(50));

INSERT INTO Students VALUES ('Alice'), ('Bob');
INSERT INTO Teachers VALUES ('Mr. Smith'), ('Alice');

-- Combine lists
SELECT Name FROM Students
UNION
SELECT Name FROM Teachers;

/*
Result:
- Alice appears once (duplicates removed)
- Combined list of names
*/

--------------------------------------------------------
-- 6. UNION ALL (KEEP DUPLICATES)
--------------------------------------------------------

SELECT Name FROM Students
UNION ALL
SELECT Name FROM Teachers;

/*
Result:
- Alice appears twice
- Faster than UNION (no deduplication)
*/

--------------------------------------------------------
-- 7. UNION FOR REPORTING (BACKGROUND CHECK STYLE)
--------------------------------------------------------

-- Simulate multiple data sources
CREATE TABLE CurrentRecords (
  Name VARCHAR(50),
  DOB DATE,
  Offense VARCHAR(100)
);

CREATE TABLE ArchivedRecords (
  Name VARCHAR(50),
  DOB DATE,
  Offense VARCHAR(100)
);

INSERT INTO CurrentRecords VALUES
('John Doe', '1990-01-01', 'Theft');

INSERT INTO ArchivedRecords VALUES
('Jane Smith', '1985-05-10', 'Fraud');

-- Combine into one report
SELECT Name, DOB, Offense, 'Current' AS Source
FROM CurrentRecords

UNION

SELECT Name, DOB, Offense, 'Archived'
FROM ArchivedRecords;

/*
Result:
- One unified report
- Shows where each record came from
*/

--------------------------------------------------------
-- 8. UNION FOR MATCH TYPES (VERY PRACTICAL)
--------------------------------------------------------

-- Exact matches (SSN match)
SELECT Name, DOB, 'Exact Match' AS MatchType
FROM Person
WHERE SSN = '123-45-6789'

UNION

-- Possible matches (same name + close DOB)
SELECT Name, DOB, 'Possible Match'
FROM Person
WHERE Name = 'John Doe'
  AND ABS(DATEDIFF(DOB, '1990-01-01')) <= 1;

/*
Result:
- Shows both exact + possible matches
- Useful for background check workflows
*/

--------------------------------------------------------
-- 9. IMPORTANT RULES FOR UNION
--------------------------------------------------------

-- ✔ Same number of columns
-- ✔ Same column order
-- ✔ Compatible data types

-- Example (VALID)
SELECT Name, DOB FROM Person
UNION
SELECT Name, DOB FROM CurrentRecords;

-- Example (INVALID → ERROR)
-- SELECT Name FROM Person
-- UNION
-- SELECT Name, DOB FROM CurrentRecords;

--------------------------------------------------------
-- END OF FILE
--------------------------------------------------------
