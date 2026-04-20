# 🧱 Implementing Attributes (SQL / Database Design)

## 📌 Definition

In database design:

- **Entities → Tables**
- **Attributes → Columns**

However, not all attributes are implemented the same way.

---

# 🔁 Singular vs Plural Attributes

## 🔹 Singular Attribute

A **singular attribute** has only one value per row.

### ✅ Implementation

- Stays as a column in the original table

---

## 🔹 Plural Attribute

A **plural attribute** can have multiple values for one entity.

### 🚨 Rule (VERY IMPORTANT)

> If an attribute can have multiple values → create a new table

---

# 🧱 Implementing Plural Attributes

## 📌 Standard Design (Preferred)

### Rules:

1. Create a **new table**
2. Include:
   - The plural attribute
   - A **foreign key** referencing the original table

3. Define **composite primary key**:
   - (Foreign Key + Plural Attribute)

4. Apply:
   - **PK cascade**
   - **FK restrict**

5. Naming convention:
   - `OriginalTable + AttributeName`

---

## 🧠 Example

### Original Table:

```
Flight
- FlightNumber (PK)
- AirlineCode
- DepartureTime
- MealType (plural)
```

---

### New Table:

```
FlightMeal
- FlightNumber (FK)
- MealType
PRIMARY KEY (FlightNumber, MealType)
```

---

## ⚠️ Alternative Design (NOT Recommended)

If plural attribute has a **small, fixed maximum**, you can use:

```
Meal1Type
Meal2Type
Meal3Type
```

### 🚨 Warning:

- Less flexible
- Harder queries
- Not scalable

---

# 📝 Exercise 4.12.2 (Answered)

### Scenario:

Plural attribute `UpdateTime` in `Booking`

---

### ✅ Answers:

**1. Table Name**

```
BookingUpdateTime
```

---

**2. Primary Key**

```
(FlightNumber, PassengerKey, UpdateTime)
```

---

**3. Foreign Key**

```
(FlightNumber, PassengerKey)
```

---

# 🧾 Implementing Attribute Types

## 📌 Concept

Each attribute has a **type** → mapped to an **SQL data type**

---

## 🔹 Example Mapping

| Attribute Type | SQL Data Type |
| -------------- | ------------- |
| Code           | CHAR(3)       |
| Name           | VARCHAR(30)   |

---

## 🧠 Key Rule

> Attribute names include their type → determines SQL data type

---

## 🧠 Example

```sql
CREATE TABLE Airport (
  AirportCode CHAR(3),
  AirportName VARCHAR(30),
  CountryCode CHAR(3),
  CityName VARCHAR(30)
);
```

---

# 📝 Exercise 4.12.4 (Answered)

**1. Attribute names always include an attribute type**

```
True
```

**2. Data types are independent of the database system**

```
False
```

**3. Data type depends on attribute cardinality**

```
False
```

---

# 🔢 Implementing Attribute Cardinality

## 📌 Concept

Cardinality determines constraints:

| Symbol | Meaning     | SQL         |
| ------ | ----------- | ----------- |
| R      | Required    | NOT NULL    |
| U      | Unique      | UNIQUE      |
| •      | Primary Key | PRIMARY KEY |

---

## 🧠 Rules

### Required Attribute

```sql
NOT NULL
```

---

### Unique Attribute

```sql
UNIQUE
```

---

### Primary Key

```sql
PRIMARY KEY
```

---

### Default Behavior

- Optional (NULL allowed)
- Not unique

---

## 🔗 Composite Constraints (VERY IMPORTANT)

### ❌ Incorrect

```sql
IDNumber INT UNIQUE,
IDType CHAR(1) UNIQUE
```

---

### ✅ Correct

```sql
UNIQUE (IDNumber, IDType)
```

---

# 📝 Exercise 4.12.6 (Answered)

### Given:

```
CourseName U
CreditQuantity R
CatalogCode R U
(DepartmentCode, CourseNumber) = PK
```

---

### ✅ Answers:

**A**

```
UNIQUE
```

**B**

```
NOT NULL
```

**C**

```
NOT NULL UNIQUE
```

(or)

```
UNIQUE NOT NULL
```

---

**D**

```
PRIMARY KEY
```

---

# 🧠 SQL Implementation Example

```sql
CREATE TABLE Passenger(
  PassengerKey INT PRIMARY KEY,
  FullName VARCHAR(30) NOT NULL,
  RewardsNumber INT UNIQUE,
  BirthDate DATE,
  IDNumber INT,
  IDType CHAR(1),
  UNIQUE (IDNumber, IDType)
);
```

---

# 📝 Exercise 4.12.7 (Answered)

**1. Plural attributes are implemented as new weak tables**

```
True
```

**2. Logical design ends after implementing attributes**

```
False
```

**3. Attribute name indicates data type**

```
True
```

---

# 🧠 Implementation Workflow (Step 7)

| Step | Description                             |
| ---- | --------------------------------------- |
| 7A   | Create new tables for plural attributes |
| 7B   | Add FK with cascade/restrict            |
| 7C   | Assign SQL data types                   |
| 7D   | Apply NOT NULL, UNIQUE, PRIMARY KEY     |

---

# ⚠️ Common Mistakes

- ❌ Keeping plural attributes in same table
- ❌ Forgetting composite primary key
- ❌ Inline composite constraints
- ❌ Assuming all attributes are required
- ❌ Ignoring naming conventions

---

# 🔥 Final Mental Model

> “If one entity can have MANY values → create a new table”

---

# 🚀 Final Summary

- Singular → column
- Plural → new weak table
- Attribute type → SQL data type
- Cardinality → constraints
- Composite constraints → separate clause

---
