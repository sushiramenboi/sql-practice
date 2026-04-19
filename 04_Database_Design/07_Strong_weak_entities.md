# 🧱 Strong & Weak Entities (ER Modeling)

## 📌 Definition

In database design, entities are classified into:

- **Strong Entity** → can be identified on its own
- **Weak Entity** → depends on another entity for identification

---

# 💪 Strong Entities

## 📌 Definition

A **strong entity** has at least one **identifying attribute**.

### 🔑 Identifying Attribute

An identifying attribute must be:

- **Unique** → no duplicates
- **Singular** → only one value per entity instance
- **Required** → cannot be NULL

> Identifying attributes map **one-to-one** with entity instances

---

## 🧾 Example

### Entity: `Project`

| ProjectNumber | ProjectName | StartDate | EndDate |
| ------------- | ----------- | --------- | ------- |
| 101           | Build App   | 2026-01   | 2026-06 |
| 102           | Upgrade DB  | 2026-02   | 2026-07 |

- `ProjectNumber`:
  - unique ✅
  - singular ✅
  - required ✅

👉 Therefore:

- `ProjectNumber` = identifying attribute
- `Project` = **strong entity**

---

## ⚠️ Implementation Insight

- Strong entities become **tables**
- Identifying attribute → usually becomes **PRIMARY KEY**

---

# 🧩 Weak Entities

## 📌 Definition

A **weak entity**:

- Has **no identifying attribute**
- Cannot be uniquely identified alone
- Depends on another entity

---

## 🔗 Identifying Relationship

Instead of an identifying attribute, weak entities use:

- **Identifying relationship** → connection to another entity
- **Identifying entity** → the parent entity

### ⚠️ Rule (VERY IMPORTANT)

The identifying entity must be:

- **Singular (1)**
- **Required (mandatory)**

---

## 🧾 Example

### Entities: `Project` → `Task`

| ProjectNumber | TaskCode | TaskName |
| ------------- | -------- | -------- |
| 101           | A        | Design   |
| 101           | B        | Build    |
| 102           | A        | Plan     |

### Problem:

- `TaskCode` is NOT globally unique ❌

👉 Therefore:

- `Task` = **weak entity**

---

## 🔑 Composite Identification

Weak entities are identified using:

(ProjectNumber, TaskCode)

👉 Combination makes each row unique

---

# 🔷 Identifying Relationship (CRITICAL)

## 📌 Definition

A relationship that:

- Connects weak entity → identifying entity
- Replaces identifying attribute

---

## 🧠 Diagram Rules

- Shown with a **diamond symbol**
- Diamond is placed next to the **identifying entity**
- Replaces cardinality symbols on that side

---

# 🧠 Composite Identifiers (HIGH-YIELD)

Weak entities often use **composite keys**

---

## 📌 Examples

### 1. Project → Task

(ProjectNumber, TaskName)

### 2. Task → SubTask

(ProjectNumber, TaskName, SubtaskCode)

### 3. Passenger + Flight → Booking

(FlightNumber, PassengerID, BookingDate)

---

## ⚠️ Important Rule

> Composite identifiers depend on **business rules**, not just diagrams

---

# 🔁 Weak Entity Chains

Weak entities can be identified by:

- ✅ Strong entity
- ✅ Another weak entity
- ✅ Multiple entities

---

## 🧾 Examples

- `Project → Task → SubTask`
- `Passenger + Flight → Booking`

---

# 📊 Strong vs Weak (Quick Comparison)

| Feature               | Strong Entity       | Weak Entity       |
| --------------------- | ------------------- | ----------------- |
| Identifying attribute | ✅ Yes              | ❌ No             |
| Independent existence | ✅ Yes              | ❌ No             |
| Needs another entity  | ❌ No               | ✅ Yes            |
| Identification method | Attribute           | Relationship      |
| Primary key           | Single or composite | Usually composite |

---

# 🧠 How to Identify in Questions (STEP-BY-STEP)

### 🔍 Step 1: Check attributes

- Is there an attribute that is:
  - unique
  - singular
  - required

👉 YES → **Strong entity**

---

### 🔍 Step 2: If NOT

- Does it depend on another entity?

👉 YES → **Weak entity**

---

### 🔍 Step 3: Check relationship

- Must be:
  - singular (1)
  - required

---

### 🔍 Step 4: Build identifier

- Combine:
  - parent key
  - - weak entity attribute

---

# ⚠️ Common Traps (EXAM CRITICAL)

### ❌ Trap 1: Looks unique but isn’t

- Example: `TaskCode`
- Unique only within project, not globally

---

### ❌ Trap 2: Optional attribute

- If attribute is optional → ❌ NOT identifying

---

### ❌ Trap 3: Weak entity = no key

- Wrong ❌
- Weak entities DO have identifiers (composite)

---

### ❌ Trap 4: Missing "required"

- Identifying relationship must be mandatory

---

# 🏗️ Real-World Example

## Scenario

- Department → Course → Exam

---

### 🟢 Department

- Unique name  
  👉 **Strong entity**

---

### 🟡 Course

- CourseNumber repeats across departments  
  👉 Needs Department

(DepartmentName, CourseNumber)

👉 **Weak entity**

---

### 🔴 Exam

- Sequence resets per course

(DepartmentName, CourseNumber, ExamNumber)

👉 **Weak entity**

---

# 🧠 Identifying Entities Rules (TESTED)

- An identifying entity can be:
  - **Strong OR Weak**

- A weak entity can be identified by:
  - **One or many relationships**

- One entity can identify:
  - **Zero, one, or many weak entities**

---

# 🔄 Database Design Process

### Step 3A

Identify strong vs weak entities

### Step 3B

Determine identifying relationships

### Step 3C

Document in:

- ER diagram
- Glossary

---

## ⚠️ Important

> These steps are **iterative**, not strictly ordered

---

# 🧠 Final Mental Model

- Strong entity → "I stand alone"
- Weak entity → "I depend on another"
- Identifying attribute → "I uniquely identify"
- Identifying relationship → "I rely on you"
