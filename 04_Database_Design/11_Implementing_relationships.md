# 🔗 Implementing Relationships (Module 4.11 — Reviewer)

## 📌 Overview

This module focuses on converting **ER diagram relationships into database structures**.

### Core Transformation:

- **Many-One → Foreign Key**
- **One-One → Foreign Key**
- **Many-Many → New Table (Weak Table)**

---

# 🔁 Relationship Implementation Rules (CRITICAL)

| Relationship Type | Implementation                           |
| ----------------- | ---------------------------------------- |
| Many-One          | Foreign key on **many side**             |
| One-One           | Foreign key in **table with fewer rows** |
| Many-Many         | **New table** with 2 foreign keys        |

---

# 🔗 Implementing Many-One Relationships

## 📌 Rule

> Place the foreign key in the **"many" side** table

---

## 🧠 Key Concepts

- FK references the **primary key of the "one" side**
- If the "one" side is **required**, FK is **NOT NULL**
- FK name = referenced PK name + optional prefix

---

## 🧱 Example

**Flight → Airport (ArrivesAt)**

```sql
Flight(
  FlightNumber,
  AirlineCode,
  DepartureTime,
  ArrivalAirportCode  -- FK
)

Airport(
  AirportCode,  -- PK
  AirportName
)
```

---

## ⚠️ Important Rules

- Many side = gets the foreign key
- Required relationship = FK must be NOT NULL
- Optional relationship = FK can be NULL

---

## ❌ Common Mistakes

- Putting FK on the "one" side → ❌
- Forgetting NOT NULL when required → ❌
- Using wrong FK name → ❌

---

# 🔗 Implementing One-One Relationships

## 📌 Rule

> Place the foreign key in the **table with fewer rows**

---

## 🧠 Key Concepts

- FK can go on **either side**, but:
  👉 Choose the table with fewer rows (minimize NULLs)

- FK must be:
  - **UNIQUE**
  - **NOT NULL** (if required)

---

## 🧱 Example

**Airport → Address**

```sql
Airport(
  AirportCode,
  AirportName,
  AirportAddressID UNIQUE NOT NULL  -- FK
)

Address(
  AddressID,  -- PK
  StreetName,
  CityName,
  PostalCode
)
```

---

## ⚠️ Important Rules

- FK must be **UNIQUE** (one-to-one constraint)
- Required relationship → FK is NOT NULL
- Optional → FK can be NULL

---

## ❌ Common Mistakes

- Forgetting UNIQUE constraint → ❌
- Putting FK in wrong table → ❌
- Not considering NULL values → ❌

---

# 🔗 Implementing Many-Many Relationships

## 📌 Rule

> Create a **new table (weak table)**

---

## 🧠 Key Concepts

- New table contains:
  - **Two foreign keys**

- Primary key = **composite of both FKs**

---

## 🧱 Example

**Airline ↔ Flight**

```sql
Airline(
  AirlineCode,
  AirlineName
)

Flight(
  FlightID,
  FlightDuration
)

AirlineFlight(
  AirlineCode,  -- FK
  FlightID,     -- FK
  AirlineFlightNumber,
  PRIMARY KEY (AirlineCode, FlightID)
)
```

---

## ⚠️ Important Rules

- Composite PK = both foreign keys
- Table name = combination of entities
- Can include **extra attributes**

---

## 🔥 Extra Column Example

```sql
AirlineFlightNumber
```

👉 Represents data about the relationship itself

---

## ❌ Common Mistakes

- Trying to use FK instead of new table → ❌
- Forgetting composite PK → ❌
- Missing relationship attributes → ❌

---

# 🔑 Foreign Key Naming Rules

## 📌 Pattern

```
[OptionalPrefix] + ReferencedPrimaryKey
```

---

## 🧠 Examples

| Relationship | FK Name              |
| ------------ | -------------------- |
| ArrivesAt    | ArrivalAirportCode   |
| AssignedTo   | AssignedAircraftCode |
| Provides     | ProviderPassengerKey |

---

## ⚠️ Key Idea

- Prefix = optional (adds clarity)
- Must include referenced PK name

---

# 🔒 Required vs Optional Relationships

## 📌 Rule

| Relationship Type | FK Requirement |
| ----------------- | -------------- |
| Required          | NOT NULL       |
| Optional          | NULL allowed   |

---

## 🧠 Example

- Required Airport → FK must exist
- Optional Aircraft → FK can be NULL

---

# 🧱 Composite Key in Many-Many (VERY IMPORTANT)

## 📌 Rule

> PK = combination of both foreign keys

---

## 🧠 Example

```sql
PRIMARY KEY (PassengerKey, CardNumber)
```

---

## ⚠️ Special Case

If duplicates are allowed:

```sql
PRIMARY KEY (PassengerKey, CardNumber, ExtraColumn)
```

---

# 🔄 Database Design Process (Where This Fits)

## 📌 Step 6: Implement Relationships

| Step | Action                        |
| ---- | ----------------------------- |
| 6A   | Many-One → FK on many side    |
| 6B   | One-One → FK on smaller table |
| 6C   | Many-Many → New table         |

---

# ⚠️ Common Traps (TEST FAVORITES)

- Putting FK on wrong side → ❌
- Forgetting UNIQUE in one-one → ❌
- Not creating table for many-many → ❌
- Forgetting composite PK → ❌
- Confusing required vs optional → ❌

---

# 🧠 Final Mental Model

### Step 1: Identify relationship type

- Many-One?
- One-One?
- Many-Many?

---

### Step 2: Apply rule

| Type      | Action              |
| --------- | ------------------- |
| Many-One  | FK on many side     |
| One-One   | FK on smaller table |
| Many-Many | New table           |

---

### Step 3: Configure FK

- Name correctly
- Set NULL / NOT NULL
- Add UNIQUE if needed

---

### Step 4: Validate

- FK references correct PK?
- Constraints correct?
- Structure matches relationship?

---

# 🔥 Bottom Line

> Relationships are implemented using **foreign keys or new tables** — choosing the correct method is critical.

Master this → You pass the OA.
