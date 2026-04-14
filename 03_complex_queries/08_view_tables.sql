/*
========================================
CREATE VIEW: ManagerView
========================================

💡 WHAT THIS DOES:
Creates a "virtual table" (VIEW) that shows:
- Department name
- Manager name

Instead of writing a JOIN every time, we save it once.

----------------------------------------
TABLES USED
----------------------------------------

Department Table:
+----------------------+-----------+
| DepartmentName       | ManagerID |
+----------------------+-----------+
| Engineering          | 2538      |
| Sales                | 2538      |
| Marketing            | 6381      |
| Technical support    | 6381      |
+----------------------+-----------+

Employee Table:
+------------+-------------------+
| EmployeeID | EmployeeName      |
+------------+-------------------+
| 2538       | Lisa Ellison      |
| 5384       | Sam Snead         |
| 6381       | Maria Rodriguez   |
+------------+-------------------+

----------------------------------------
VIEW CREATION
----------------------------------------
*/

CREATE VIEW ManagerView 
AS
SELECT 
    Department.DepartmentName,                 -- Get department name
    Employee.EmployeeName AS ManagerName       -- Rename for clarity
FROM Department, Employee
WHERE Department.ManagerID = Employee.EmployeeID;  
-- Match manager ID to employee ID (JOIN condition)

/*
----------------------------------------
RESULTING VIEW (Virtual Table)
----------------------------------------

+----------------------+-------------------+
| DepartmentName       | ManagerName       |
+----------------------+-------------------+
| Engineering          | Lisa Ellison      |
| Sales                | Lisa Ellison      |
| Marketing            | Maria Rodriguez   |
| Technical support    | Maria Rodriguez   |
+----------------------+-------------------+

----------------------------------------
🔥 EASY ACCESS (MAIN BENEFIT)
----------------------------------------

Instead of rewriting the JOIN:

SELECT DepartmentName, EmployeeName
FROM Department, Employee
WHERE ManagerID = EmployeeID;

You can now just do:

>>> SELECT * FROM ManagerView;

💡 This is why VIEWS are powerful:
- Cleaner queries
- Reusable logic
- Faster development
- Less errors

----------------------------------------
IMPORTANT NOTES
----------------------------------------
- VIEW does NOT store data
- It always pulls LIVE data from tables
- If tables update → VIEW updates automatically

*/







/*
========================================
CREATE VIEW: MathFacultyView
========================================

💡 WHAT THIS DOES:
Creates a virtual table (VIEW) that shows:
- Professor name
- Their department (assignment)

BUT only for the MATH department.

----------------------------------------
TABLES USED
----------------------------------------

Faculty Table:
+----+--------------+------+
| ID | FacultyName  | Code |
+----+--------------+------+
| 1  | Grayson      | ART  |
| 2  | Wayne        | ART  |
| 3  | Stark        | COMP |
| 4  | Parker       | MATH |
| 5  | Banner       | MATH |
| 6  | Quinn        | MATH |
| 7  | Grey         | NULL |
+----+--------------+------+

Department Table:
+------+-----------------------------+
| Code | DepartmentName              |
+------+-----------------------------+
| ART  | Art Department              |
| COMP | Computer Science Department |
| ENG  | English Department          |
| HIST | History Department          |
| MATH | Math Department             |
+------+-----------------------------+

----------------------------------------
VIEW CREATION
----------------------------------------
*/

CREATE VIEW MathFacultyView AS
SELECT 
    Faculty.FacultyName AS Professor,       -- Rename column for clarity
    Department.DepartmentName AS Assignment -- Show department name
FROM Faculty, Department
WHERE Faculty.Code = Department.Code        -- JOIN: match faculty to department
  AND Department.Code = 'MATH';             -- FILTER: only Math department

/*
----------------------------------------
RESULTING VIEW (Virtual Table)
----------------------------------------

+-----------+------------------+
| Professor | Assignment       |
+-----------+------------------+
| Parker    | Math Department  |
| Banner    | Math Department  |
| Quinn     | Math Department  |
+-----------+------------------+

----------------------------------------
🔥 EASY ACCESS (MAIN BENEFIT)
----------------------------------------

Instead of rewriting the JOIN + filter:

SELECT FacultyName, DepartmentName
FROM Faculty, Department
WHERE Faculty.Code = Department.Code
  AND Department.Code = 'MATH';

You can now just do:

>>> SELECT * FROM MathFacultyView;

----------------------------------------
IMPORTANT NOTES
----------------------------------------
- VIEW does NOT store data (virtual table)
- Always reflects latest data from tables
- Simplifies complex queries
- Great for reuse and readability

*/







/*
========================================
VIEW + USER QUERY (MERGED BEHAVIOR)
========================================

💡 WHAT THIS DEMONSTRATES:
- A VIEW is just a saved query
- When you query a VIEW, SQL COMBINES (merges) both queries
- Then runs it on the base tables

----------------------------------------
BASE TABLES
----------------------------------------

Department Table:
+------+----------------------+-----------+
| Code | DepartmentName       | ManagerID |
+------+----------------------+-----------+
| 44   | Engineering          | 2538      |
| 82   | Sales                | 2538      |
| 12   | Marketing            | 6381      |
| 99   | Technical support    | 6381      |
+------+----------------------+-----------+

Employee Table:
+------------+-------------------+--------+
| EmployeeID | EmployeeName      | Salary |
+------------+-------------------+--------+
| 2538       | Lisa Ellison      | 45000  |
| 5384       | Sam Snead         | 32000  |
| 6381       | Maria Rodriguez   | 95000  |
+------------+-------------------+--------+

----------------------------------------
STEP 1: CREATE VIEW
----------------------------------------

This VIEW connects departments to their managers.
*/

CREATE VIEW ManagerView AS
SELECT 
    Department.DepartmentName,
    Employee.EmployeeName AS ManagerName
FROM Department, Employee
WHERE Department.ManagerID = Employee.EmployeeID;

/*
----------------------------------------
VIEW OUTPUT (Virtual Table)
----------------------------------------

+----------------------+-------------------+
| DepartmentName       | ManagerName       |
+----------------------+-------------------+
| Engineering          | Lisa Ellison      |
| Sales                | Lisa Ellison      |
| Marketing            | Maria Rodriguez   |
| Technical support    | Maria Rodriguez   |
+----------------------+-------------------+

----------------------------------------
STEP 2: USER QUERY (QUERYING THE VIEW)
----------------------------------------

User wants ONLY the manager of Sales:
*/

SELECT ManagerName
FROM ManagerView
WHERE DepartmentName = 'Sales';

/*
----------------------------------------
🔥 WHAT SQL ACTUALLY DOES (MERGED QUERY)
----------------------------------------

The database COMBINES the view query + user query:

SELECT Employee.EmployeeName AS ManagerName
FROM Department, Employee
WHERE Department.DepartmentName = 'Sales'
  AND Department.ManagerID = Employee.EmployeeID;

----------------------------------------
FINAL RESULT
----------------------------------------

+-------------------+
| ManagerName       |
+-------------------+
| Lisa Ellison      |
+-------------------+

----------------------------------------
🧠 KEY TAKEAWAY
----------------------------------------

- VIEW = saved query
- Your query + view query = merged together
- Database runs ONE final query on base tables

----------------------------------------
🔥 WHY THIS IS POWERFUL
----------------------------------------

Instead of writing complex JOIN every time:

SELECT EmployeeName
FROM Department, Employee
WHERE DepartmentName = 'Sales'
  AND ManagerID = EmployeeID;

You just do:

>>> SELECT ManagerName FROM ManagerView WHERE DepartmentName = 'Sales';

Cleaner, reusable, and less error-prone.

----------------------------------------
IMPORTANT NOTES
----------------------------------------

- VIEW does NOT store data
- Always reflects latest table data
- Querying a view = querying base tables indirectly

*/









/*
========================================
VIEW WITH CHECK OPTION (INSERT RESTRICTION)
========================================

💡 WHAT THIS DEMONSTRATES:
- A VIEW can restrict what data can be inserted/updated
- WITH CHECK OPTION enforces the view's condition
- You cannot insert data that does NOT match the view filter

----------------------------------------
BASE TABLE
----------------------------------------

Employee Table:
+------------+-------------------+----------------+
| EmployeeID | EmployeeName      | DepartmentCode |
+------------+-------------------+----------------+
| 2538       | Lisa Ellison      | 23             |
| 5384       | Sam Snead         | 51             |
| 6381       | Maria Rodriguez   | 51             |
+------------+-------------------+----------------+

----------------------------------------
STEP 1: CREATE VIEW
----------------------------------------

This view ONLY shows employees in department 51 (Sales)
*/

CREATE VIEW SalesEmployee (ID, Name, Department)
AS
SELECT *
FROM Employee
WHERE DepartmentCode = 51
WITH CHECK OPTION;

/*
----------------------------------------
VIEW OUTPUT (Virtual Table)
----------------------------------------

+------+-------------------+------------+
| ID   | Name              | Department |
+------+-------------------+------------+
| 5384 | Sam Snead         | 51         |
| 6381 | Maria Rodriguez   | 51         |
+------+-------------------+------------+

----------------------------------------
STEP 2: USER INSERT (INVALID ❌)
----------------------------------------

User tries to insert:

INSERT INTO SalesEmployee
VALUES (8520, 'Jiho Chen', 80);

----------------------------------------
❌ WHY THIS FAILS
----------------------------------------

- View condition: DepartmentCode = 51
- Inserted value: Department = 80

👉 80 does NOT satisfy the view condition

----------------------------------------
🔥 WHAT WITH CHECK OPTION DOES
----------------------------------------

It enforces:

"Any data inserted through this view MUST still match the view filter"

So SQL checks:

Is 80 = 51 ? → ❌ NO → REJECTED

----------------------------------------
🧠 KEY TAKEAWAY
----------------------------------------

- VIEW filter = DepartmentCode = 51
- WITH CHECK OPTION = enforce that rule on INSERT/UPDATE
- Invalid data → ❌ rejected

----------------------------------------
🔥 EASY WAY TO THINK ABOUT IT
----------------------------------------

Without CHECK OPTION:
- You could insert anything (even outside the view)
- It just wouldn’t show up in the view

With CHECK OPTION:
- You are FORCED to follow the view rules

----------------------------------------
IMPORTANT NOTES
----------------------------------------

- VIEW does NOT store data (still virtual)
- Insert goes to base table (Employee)
- CHECK OPTION acts like a "guardrail"

*/

