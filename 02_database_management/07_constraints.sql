-- =========================================
-- CREATE TABLE WITH CONSTRAINTS
-- =========================================

CREATE TABLE Country (
    ContinentCode CHAR(2),
    ISOCode3 CHAR(3),
    Name VARCHAR(60),
    Area FLOAT,

    -- UNIQUE constraint (named)
    -- Ensures the combination of ContinentCode + ISOCode3 is unique
    CONSTRAINT UniqueCode UNIQUE (ContinentCode, ISOCode3)
);




-- =========================================
-- INSERT BEHAVIOR (WHAT HAPPENS)
-- =========================================

-- If you try to insert duplicate combinations:
-- (ContinentCode, ISOCode3) must be unique

-- Example:
-- ('NA', 'USA') ✅ allowed
-- ('NA', 'USA') ❌ rejected (duplicate combination)




-- =========================================
-- DROP UNIQUE CONSTRAINT (MySQL way)
-- =========================================

-- In MySQL, UNIQUE constraints are stored as INDEXES
-- So you must use DROP INDEX (not DROP CONSTRAINT)

ALTER TABLE Country
DROP INDEX UniqueCode;




-- =========================================
-- ADD CHECK CONSTRAINT (NAMED)
-- =========================================

-- Adds a rule that ManagerID must be greater than 999

ALTER TABLE Department
ADD CONSTRAINT CheckManager
CHECK (ManagerID > 999);




-- =========================================
-- DROP CHECK CONSTRAINT
-- =========================================

-- Removes the CHECK rule

ALTER TABLE Department
DROP CHECK CheckManager;




-- =========================================
-- MODIFY COLUMN (ADD NOT NULL)
-- =========================================

-- NOT NULL is NOT a separate constraint
-- It is part of the column definition

ALTER TABLE Department
CHANGE Salary Salary INT NOT NULL;




-- =========================================
-- GENERAL RULES SUMMARY
-- =========================================

/*
CREATE TABLE → create a new table
DROP TABLE → delete the entire table
ALTER TABLE → modify an existing table

CONSTRAINT TYPES:

1. Named constraints (use ADD/DROP):
    - CHECK
    - UNIQUE
    - FOREIGN KEY
    - PRIMARY KEY

2. Column constraints (use CHANGE):
    - NOT NULL
    - DEFAULT

MYSQL-SPECIFIC:

- UNIQUE → dropped using DROP INDEX
- CHECK → dropped using DROP CHECK (MySQL 8+)
- FOREIGN KEY → DROP FOREIGN KEY
- PRIMARY KEY → DROP PRIMARY KEY

KEY IDEA:

- Constraints = rules for data
- If rule is violated → SQL rejects the data
*/