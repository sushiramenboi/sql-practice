-- Create Employee table (Parent)
CREATE TABLE Employee (
    ID SMALLINT UNSIGNED AUTO_INCREMENT,   -- Unique ID (auto-generated, no negatives)
    Name VARCHAR(60) NOT NULL,             -- Employee name (required)
    Salary DECIMAL(7,2),                   -- Salary with decimals
    PRIMARY KEY (ID)                       -- Ensures each ID is unique
);

-- Create Family table (Child)
CREATE TABLE Family (
    ID SMALLINT UNSIGNED,                  -- Refers to Employee ID
    Number SMALLINT UNSIGNED,              -- Family member number (1, 2, 3...)
    Relationship VARCHAR(20),              -- Spouse, Son, Daughter, etc.
    Name VARCHAR(60),                      -- Family member name

    PRIMARY KEY (ID, Number),              -- Composite key (unique together)
    FOREIGN KEY (ID) REFERENCES Employee(ID) -- Links to Employee table
);

-- Insert into Employee (AUTO_INCREMENT handles ID)
INSERT INTO Employee (Name, Salary)
VALUES ('Maria Rodriguez', 92300);

-- Insert into Family (must match existing Employee ID)
INSERT INTO Family (ID, Number, Relationship, Name)
VALUES (1, 1, 'Spouse', 'Jose Rodriguez');

-- Example JOIN (combine both tables)
SELECT 
    e.Name AS EmployeeName,
    f.Relationship,
    f.Name AS FamilyMember
FROM Employee e
JOIN Family f ON e.ID = f.ID;


## Notes

-- PRIMARY KEY → uniqueness
-- COMPOSITE KEY → uniqueness using multiple columns
-- FOREIGN KEY → relationship between tables
-- AUTO_INCREMENT → automatic ID generation
-- INSERT → must match column count or specify columns
-- UNSIGNED → prevents negative values