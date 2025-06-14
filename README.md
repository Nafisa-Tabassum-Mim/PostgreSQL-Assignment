﻿# PostgreSQL-Assignment

### 1. **What is PostgreSQL?**

PostgreSQL is a powerful, open-source relational database system used to store, manage, and retrieve structured data using SQL.

---

### 2. **Purpose of a Database Schema in PostgreSQL**

A schema organizes database objects (tables, views, functions) into logical groups, helping manage access and avoid name conflicts.

---

### 3. **Primary Key vs Foreign Key**

* **Primary Key**: Uniquely identifies each row in a table.
* **Foreign Key**: References a primary key in another table to establish relationships.

---

### 4. **VARCHAR vs CHAR**

* **VARCHAR(n)**: Variable-length string up to `n` characters (more efficient).
* **CHAR(n)**: Fixed-length string of `n` characters (padded with spaces if shorter).

---

### 5. **Purpose of WHERE Clause**

Filters rows in a `SELECT` (or other) query to return only those that meet specific conditions.

---

### 6. **LIMIT and OFFSET**

* **LIMIT**: Restricts the number of rows returned.
* **OFFSET**: Skips a number of rows before starting to return results (useful for pagination).

---

### 7. **UPDATE Statement**

Used to modify existing data in a table.

---

### 8. **JOIN Operation**

Combines rows from two or more tables based on a related column (like foreign keys).

Types: `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `FULL OUTER JOIN`.

---

### 9. **GROUP BY Clause**

Groups rows by a specific column to perform aggregation (like totals) on each group.

---

### 10. **Aggregate Functions**

* `COUNT()`: Counts rows
* `SUM()`: Adds values
* `AVG()`: Calculates average
* `MIN()`: Calculates min value 
* `MAX()`: Calculates max value 

Used with `SELECT`, often alongside `GROUP BY`.
