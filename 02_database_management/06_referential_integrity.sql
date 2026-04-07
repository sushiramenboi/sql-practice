-- =========================================================
-- REFERENTIAL INTEGRITY ACTIONS
-- =========================================================
-- Referential integrity means:
-- a foreign key value in a child table must match an existing
-- primary key value in the parent table, unless NULL is allowed.
--
-- Parent table  = the table being referenced
-- Child table   = the table holding the foreign key
--
-- Example:
-- Employee.ID is the parent key
-- Department.ManagerID is the child foreign key
-- =========================================================


-- =========================================================
-- 1) PARENT TABLE
-- =========================================================
CREATE TABLE Employee (
    ID INT PRIMARY KEY,          -- Unique employee identifier
    Name VARCHAR(50)             -- Employee name
);


-- =========================================================
-- 2) BASIC FOREIGN KEY
-- =========================================================
CREATE TABLE Department_Basic (
    Code INT PRIMARY KEY,        -- Unique department code
    Name VARCHAR(50),            -- Department name
    ManagerID INT,               -- Refers to Employee.ID

    -- FOREIGN KEY means ManagerID must exist in Employee.ID
    FOREIGN KEY (ManagerID) REFERENCES Employee(ID)
);


-- =========================================================
-- 3) ON DELETE RESTRICT
-- =========================================================
-- RESTRICT blocks deletion if child rows still depend on parent
CREATE TABLE Department_Restrict (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON DELETE RESTRICT
);

-- Example idea:
-- If Employee ID 1 is still used as a ManagerID in this table,
-- deleting Employee ID 1 will be rejected.


-- =========================================================
-- 4) ON DELETE CASCADE
-- =========================================================
-- CASCADE means:
-- if the parent row is deleted, related child rows are also deleted
CREATE TABLE Department_CascadeDelete (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON DELETE CASCADE
);

-- Example idea:
-- DELETE Employee ID 1
-- -> all Department rows with ManagerID = 1 are also deleted
--
-- Important:
-- CASCADE does NOT duplicate or copy rows.
-- It simply propagates the same type of action automatically.


-- =========================================================
-- 5) ON DELETE SET NULL
-- =========================================================
-- SET NULL means:
-- if the parent row is deleted, child foreign key becomes NULL
CREATE TABLE Department_SetNull (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,               -- Must allow NULL for this to work

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON DELETE SET NULL
);

-- Example idea:
-- DELETE Employee ID 1
-- -> Department.ManagerID becomes NULL
-- -> department still exists, but no manager is assigned


-- =========================================================
-- 6) ON DELETE SET DEFAULT
-- =========================================================
-- SET DEFAULT means:
-- if the parent row is deleted, child foreign key becomes
-- the column's default value
CREATE TABLE Department_SetDefault (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT DEFAULT 0,

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON DELETE SET DEFAULT
);

-- Note:
-- This depends on SQL system support.
-- The default value should make sense in the design.


-- =========================================================
-- 7) ON UPDATE CASCADE
-- =========================================================
-- UPDATE CASCADE means:
-- if the parent key changes, matching foreign keys also change
CREATE TABLE Department_UpdateCascade (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON UPDATE CASCADE
);

-- Example idea:
-- UPDATE Employee SET ID = 10 WHERE ID = 1;
-- -> Department.ManagerID automatically changes from 1 to 10


-- =========================================================
-- 8) ON UPDATE SET NULL
-- =========================================================
-- If the parent key changes, child foreign key becomes NULL
CREATE TABLE Department_UpdateSetNull (
    Code INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT,

    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)
    ON UPDATE SET NULL
);


-- =========================================================
-- 9) YOUR IMAGE-STYLE EXAMPLE
-- =========================================================
CREATE TABLE Department (
    Code TINYINT UNSIGNED,           -- Small positive department code
    Name VARCHAR(20),                -- Department name
    ManagerID SMALLINT UNSIGNED,     -- Refers to Employee.ID

    PRIMARY KEY (Code),

    -- ManagerID must match an existing Employee ID
    FOREIGN KEY (ManagerID)
    REFERENCES Employee(ID)

    -- If manager is deleted, related department row is deleted
    ON DELETE CASCADE

    -- If manager's ID changes, ManagerID becomes NULL
    ON UPDATE SET NULL
);


-- =========================================================
-- 10) SAMPLE DATA
-- =========================================================
INSERT INTO Employee (ID, Name)
VALUES
(2538, 'Lisa Ellison'),
(5384, 'Sam Snead'),
(6381, 'Maria Rodriguez'),
(7343, 'Gary Smith');

INSERT INTO Department (Code, Name, ManagerID)
VALUES
(44, 'Engineering', 2538),
(82, 'Sales', 6381),
(12, 'Marketing', 6381),
(99, 'Technical Support', 7343);


-- =========================================================
-- 11) EXAMPLE ACTIONS
-- =========================================================

-- Example A: delete a parent row
-- If ON DELETE CASCADE is active:
-- deleting Employee 6381 also deletes related department rows
-- that reference ManagerID = 6381
--
-- DELETE FROM Employee
-- WHERE ID = 6381;


-- Example B: update a parent key
-- If ON UPDATE CASCADE is active:
-- changing Employee ID 2538 to 3000 also updates Department.ManagerID
--
-- UPDATE Employee
-- SET ID = 3000
-- WHERE ID = 2538;


-- =========================================================
-- SUMMARY OF WHAT I LEARNED
-- =========================================================
-- 1. A FOREIGN KEY connects a child table to a parent table.
-- 2. Referential integrity keeps child rows from pointing to invalid parent rows.
-- 3. The parent table has the PRIMARY KEY.
-- 4. The child table stores the FOREIGN KEY.
-- 5. RESTRICT blocks a delete or update if related child rows still exist.
-- 6. CASCADE does not copy or duplicate rows.
-- 7. CASCADE means the database automatically applies the related action
--    to dependent child rows.
-- 8. ON DELETE CASCADE deletes child rows when the parent row is deleted.
-- 9. ON UPDATE CASCADE updates child foreign key values when the parent key changes.
-- 10. SET NULL keeps the child row, but removes the relationship by setting
--     the foreign key to NULL.
-- 11. SET DEFAULT keeps the child row, but changes the foreign key to its default value.
-- 12. Referential integrity helps prevent orphan records and broken relationships.
-- 13. In real systems, choosing RESTRICT, CASCADE, SET NULL, or SET DEFAULT
--     depends on business rules and what should happen to dependent data.