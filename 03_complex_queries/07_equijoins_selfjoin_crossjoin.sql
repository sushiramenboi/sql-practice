-- =========================================
-- NON-EQUIJOIN EXAMPLE (WITH SAMPLE DATA)
-- =========================================

-- Buyer Table
-- Name              | MaxPrice
-- ------------------|---------
-- Lisa Ellison      | 600000
-- Sam Snead         | 900000
-- Jiho Chen         | 500000
-- Maria Rodriguez   | 800000

-- Property Table
-- Address            | Price
-- -------------------|--------
-- 23 Maple Street    | 700000
-- 4 Oak Street       | 850000
-- 59 Alvarado Avenue | 1299000
-- 800 Richards Road  | 1000000

-- =========================================
-- QUERY
-- =========================================

SELECT Name, Address
FROM Buyer
LEFT JOIN Property
ON Price < MaxPrice;

-- =========================================
-- EXPLANATION
-- =========================================
-- NON-EQUIJOIN → uses < instead of =
-- We match buyers to properties they can afford

-- LEFT JOIN → keep ALL buyers
-- If no property matches → Address = NULL

-- LOGIC:
-- For each buyer:
--   Find properties where Price < MaxPrice

-- =========================================
-- RESULT (EXPECTED)
-- =========================================
-- Name              | Address
-- ------------------|--------------------
-- Lisa Ellison      | NULL
-- Sam Snead         | 23 Maple Street
-- Sam Snead         | 4 Oak Street
-- Jiho Chen         | NULL
-- Maria Rodriguez   | 23 Maple Street

-- =========================================
-- KEY TAKEAWAYS
-- =========================================
-- 1. One buyer can match multiple properties
-- 2. No match → NULL (because LEFT JOIN)
-- 3. This is NOT an equijoin → it's a NON-EQUIJOIN



-- =========================================
-- MIXED JOIN CONDITIONS (EQUIJOIN + NON-EQUIJOIN)
-- =========================================

-- Class Table
-- Code    | Name                      | AverageGrade
-- --------|---------------------------|--------------
-- MATH23  | Calculus 1               | 3.1
-- BIO101  | Cell Biology             | 3.6
-- CHEM89  | Organic Chemistry        | 2.2
-- MATH130 | Probability & Statistics | NULL

-- Student Table
-- ID   | Code   | Name              | StudentGrade
-- -----|--------|-------------------|--------------
-- 2943 | MATH23 | Alberto Rimas     | 3.3
-- 4408 | BIO101 | Francoise Verone  | 3.5
-- 5993 | BIO101 | Duyen Hue         | 2.9
-- 2866 | CHEM89 | Dmitri Putin      | 3.0

-- =========================================
-- QUERY #1 (INNER JOIN)
-- =========================================

SELECT Student.Name
FROM Class
INNER JOIN Student
ON StudentGrade > AverageGrade
AND Student.Code = Class.Code;

-- =========================================
-- EXPLANATION
-- =========================================
-- INNER JOIN → only returns rows that MATCH BOTH conditions

-- Condition 1 (NON-EQUIJOIN):
--   StudentGrade > AverageGrade
--   → student is performing ABOVE class average

-- Condition 2 (EQUIJOIN):
--   Student.Code = Class.Code
--   → student belongs to that class

-- RESULT:
-- Only students who:
--   1. Are in the class
--   2. Have a grade higher than the class average

-- =========================================
-- QUERY #2 (LEFT JOIN)
-- =========================================

SELECT Class.Name, Student.Name
FROM Class
LEFT JOIN Student
ON Student.Code = Class.Code
AND StudentGrade >= 3.0;

-- =========================================
-- EXPLANATION
-- =========================================
-- LEFT JOIN → keep ALL classes

-- Condition 1 (EQUIJOIN):
--   Student.Code = Class.Code
--   → match students to their class

-- Condition 2 (FILTER INSIDE JOIN):
--   StudentGrade >= 3.0
--   → only include students with grade >= 3.0

-- IMPORTANT DIFFERENCE:
-- This filter is inside the JOIN (ON), NOT WHERE

-- RESULT BEHAVIOR:
-- 1. Classes ALWAYS show (even if no students match)
-- 2. Only students with grade >= 3.0 appear
-- 3. If no student meets condition → Student.Name = NULL

-- =========================================
-- KEY TAKEAWAYS
-- =========================================
-- 1. You can MIX equijoin (=) and non-equijoin (>, <) in ON
-- 2. INNER JOIN → strict match (filters everything)
-- 3. LEFT JOIN → keeps left table no matter what
-- 4. Conditions in ON affect matching, NOT final filtering








-- =========================================
-- SELF-JOIN EXAMPLE (EMPLOYEE → MANAGER)
-- =========================================

-- Employee Table
-- ID   | Name            | Manager
-- -----|-----------------|---------
-- 2538 | Lisa Ellison    | 8820
-- 5384 | Sam Snead       | 8820
-- 6381 | Maria Rodriguez | 8820
-- 8820 | Jiho Chen       | NULL

-- =========================================
-- QUERY
-- =========================================

SELECT A.Name, B.Name
FROM Employee A
INNER JOIN Employee B
ON B.ID = A.Manager;

-- =========================================
-- EXPLANATION
-- =========================================
-- SELF-JOIN → joining the SAME table to itself

-- A = Employee (represents the worker)
-- B = Employee (represents the manager)

-- ON B.ID = A.Manager:
--   A.Manager → stores manager's ID
--   B.ID → matches that ID to find the manager row

-- So:
--   For each employee (A),
--   find another row (B) where:
--   B.ID matches A.Manager

-- =========================================
-- STEP-BY-STEP LOGIC
-- =========================================
-- Example:
-- Lisa Ellison → Manager = 8820
-- Find row where ID = 8820 → Jiho Chen

-- =========================================
-- RESULT (EXPECTED)
-- =========================================
-- A.Name            | B.Name
-- ------------------|-------------
-- Lisa Ellison      | Jiho Chen
-- Sam Snead         | Jiho Chen
-- Maria Rodriguez   | Jiho Chen

-- =========================================
-- IMPORTANT NOTES
-- =========================================
-- 1. Jiho Chen does NOT appear as A (employee)
--    because Manager = NULL → no match in INNER JOIN

-- 2. Same manager can appear multiple times
--    because multiple employees report to them

-- 3. A and B are just ALIASES (labels)
--    → same table, different roles

-- =========================================
-- KEY TAKEAWAY
-- =========================================
-- Self-join = comparing rows within the same table
-- Common use: employee → manager relationships






-- =========================================
-- SELF-JOIN WITH MULTIPLE RELATIONSHIPS (PARENTS)
-- =========================================

CREATE TABLE Person (
  ID INT,
  FullName VARCHAR(20) NOT NULL,
  FirstParentID INT,
  SecondParentID INT,
  PRIMARY KEY (ID),
  FOREIGN KEY (FirstParentID) REFERENCES Person(ID),
  FOREIGN KEY (SecondParentID) REFERENCES Person(ID)
);

-- =========================================
-- QUERY (SELF-JOIN)
-- =========================================

SELECT Child.FullName, Parent.FullName
FROM Person AS Child
INNER JOIN Person AS Parent
ON Child.FirstParentID = Parent.ID
   OR Child.SecondParentID = Parent.ID;

-- =========================================
-- EXPLANATION
-- =========================================
-- SELF-JOIN → Person table is used twice

-- Child = represents the person (child)
-- Parent = represents the parent (another row in same table)

-- JOIN CONDITION:
-- 1. Match FirstParentID → Parent.ID
-- 2. OR match SecondParentID → Parent.ID

-- This means:
-- → A child can match ONE or TWO parents
-- → Each parent will appear in a separate row

-- =========================================
-- BEHAVIOR
-- =========================================
-- If a child has:
--   1 parent → 1 row
--   2 parents → 2 rows
--   no parent → no row (because INNER JOIN)










-- =========================================
-- CROSS JOIN EXAMPLE (ALL COMBINATIONS)
-- =========================================

-- iPhone Table
-- Model | Price
-- ------|-------
-- X     | 1100
-- XR    | 800

-- Storage Table
-- Gigabytes | Price
-- ----------|------
-- 64        | 0
-- 128       | 100
-- 256       | 200

-- =========================================
-- QUERY
-- =========================================

SELECT Model, Gigabytes, IPhone.Price + Storage.Price AS TotalPrice
FROM IPhone
CROSS JOIN Storage;

-- =========================================
-- EXPLANATION
-- =========================================
-- CROSS JOIN → combines EVERY row from iPhone with EVERY row from Storage

-- No ON condition → no filtering
-- It creates ALL possible combinations (Cartesian product)

-- Total rows = rows in iPhone × rows in Storage
--             = 2 × 3 = 6 rows

-- =========================================
-- RESULT (EXPECTED)
-- =========================================
-- Model | Gigabytes | TotalPrice
-- ------|-----------|-----------
-- X     | 64        | 1100
-- XR    | 64        | 800
-- X     | 128       | 1200
-- XR    | 128       | 900
-- X     | 256       | 1300
-- XR    | 256       | 1000

-- =========================================
-- KEY TAKEAWAYS
-- =========================================
-- 1. CROSS JOIN = all combinations (no matching condition)
-- 2. Useful for generating options (e.g., product variants)
-- 3. Can grow VERY large → be careful with big tables

