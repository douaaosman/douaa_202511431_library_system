Library Management System

**Student Name:** Douaa Abdelrahman Mohamed Osman  
**Student ID:** 202511431  
**Course:** SQL Practical Exercise - Assignment III  
**Institution:** Kigali Independent University (ULK)  
**DBMS:** PostgreSQL / MySQL 8.0+  

---

## 1. Project Overview

The **Library Management System** is a relational database designed to manage library operations effectively. It tracks authors, the books written by those authors, and library members. This system helps maintain data integrity, reduce data redundancy, and facilitate multi-table relationships.

---

## 2. Database & Table Design

- **Database Name:** `douaa_202511431_library_system`

### Entities & Tables:
1. **`authors` (Parent Table):** Stores information about authors.
   - `author_id` (PRIMARY KEY, Auto-generated)
   - `author_name` (VARCHAR)
   - `country` (VARCHAR)

2. **`members` (Parent Table):** Stores information about library members.
   - `member_id` (PRIMARY KEY, Auto-generated)
   - `full_name` (VARCHAR)
   - `email` (VARCHAR, Unique)
   - `join_date` (DATE)

3. **`books` (Child Table):** Stores details about books available in the library.
   - `book_id` (PRIMARY KEY, Auto-generated)
   - `title` (VARCHAR)
   - `book_genre` (VARCHAR)
   - `published_year` (INTEGER)
   - `author_id` (FOREIGN KEY referencing `authors(author_id)`)

---

## 3. Entity-Relationship Diagram (ERD)

![ERD](erd.png)

---

## 4. SQL Practical Tasks & Execution Results

### 4.1 SELECT Tasks
- **Q1.1: Basic Data Retrieval**
  ```sql
  SELECT title, genre FROM books;