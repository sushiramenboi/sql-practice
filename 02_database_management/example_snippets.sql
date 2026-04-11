-- =========================================
-- LAB SNIPPET: CREATE MOVIE TABLE
-- Source topic: table creation + practical datatypes
-- =========================================

-- Create a Movie table with common column types.
-- Notes:
-- - ID uses SMALLINT UNSIGNED for positive numeric identifiers.
-- - Rating uses CHAR(4) to store short values like 'PG' or 'R'.
-- - Budget uses DECIMAL(8,2) for money-like precision.
CREATE TABLE Movie (
    ID SMALLINT UNSIGNED,
    Title VARCHAR(50),
    Rating CHAR(4),
    ReleaseDate DATE,
    Budget DECIMAL(8,2)
);






-- =========================================
-- LAB SNIPPET: ALTER MOVIE TABLE
-- Source topic: altering table structure
-- =========================================

-- 1) Add a new Producer column (up to 50 chars)
ALTER TABLE Movie
ADD Producer VARCHAR(50);

-- 2) Remove the Genre column from the table
ALTER TABLE Movie
DROP COLUMN Genre;

-- 3) Rename Year to ReleaseYear
ALTER TABLE Movie
RENAME COLUMN Year TO ReleaseYear;

-- 4) Change ReleaseYear datatype to SMALLINT
ALTER TABLE Movie
MODIFY COLUMN ReleaseYear SMALLINT;

-- 5) Confirm the updated table columns
SHOW COLUMNS FROM Movie;







-- =========================================
-- LAB SNIPPET: INSERT DATA INTO HORSE
-- Source topic: INSERT statements + NULL usage
-- =========================================

-- Insert row 1
INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES ('Babe', 'Quarter Horse', 15.3, '2015-02-10');

-- Insert row 2
INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES ('Independence', 'Holsteiner', 16.0, '2017-03-13');

-- Insert row 3
INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES ('Ellie', 'Saddlebred', 15.0, '2016-12-22');

-- Insert row 4 (RegisteredName is unknown)
INSERT INTO Horse (RegisteredName, Breed, Height, BirthDate)
VALUES (NULL, 'Egyptian Arab', 14.9, '2019-10-12');

-- Confirm inserted data
SELECT * FROM Horse;









-- =========================================
-- LAB SNIPPET: UPDATE ROWS IN HORSE TABLE
-- Source topic: UPDATE with WHERE + NULL assignment
-- =========================================

-- 1) Change height to 15.6 for horse with ID 2
UPDATE Horse
SET Height = 15.6
WHERE ID = 2;

-- 2) Change name and birth date for horse with ID 4
UPDATE Horse
SET RegisteredName = 'Lady Luck',
    BirthDate = '2015-05-01'
WHERE ID = 4;

-- 3) Set Breed to NULL for horses born on or after 2016-12-22
UPDATE Horse
SET Breed = NULL
WHERE BirthDate >= '2016-12-22';

-- Confirm updated data
SELECT * FROM Horse;









-- =========================================
-- LAB SNIPPET: DELETE ROWS FROM HORSE TABLE
-- Source topic: DELETE with targeted WHERE filters
-- =========================================

-- 1) Delete horse with ID 5
DELETE FROM Horse
WHERE ID = 5;

-- 2) Delete horses where breed is Holsteiner or Paint
DELETE FROM Horse
WHERE Breed = 'Holsteiner' OR Breed = 'Paint';

-- 3) Delete horses born before 2013-03-13
DELETE FROM Horse
WHERE BirthDate < '2013-03-13';

-- Confirm remaining rows
SELECT * FROM Horse;




