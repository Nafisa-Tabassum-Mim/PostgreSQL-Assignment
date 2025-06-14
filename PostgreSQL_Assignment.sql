-- Active: 1748179991249@@127.0.0.1@5432@bookstore_db@public
-- CREATE DATABASE bookstore_db;

-- table creation
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    price NUMERIC CHECK (price >= 0),
    stock INTEGER CHECK (stock >= 0),
    published_year INTEGER 
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name varchar(40) NOT NULL,
    email TEXT UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER references customers (id) ON DELETE CASCADE,
    book_id INTEGER references books (id) ON DELETE CASCADE,
    quantity INTEGER check (quantity > 0),
    order_date TIMESTAMP DEFAULT current_timestamp
);

-- drop TABLE books;
-- drop TABLE customers;
-- drop TABLE orders;

-- sample data insertion
INSERT INTO  books ( title, author, price, stock ,published_year)
VALUES  ( 'The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
  ( 'Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
  ( 'You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
  ( 'Refactoring', 'Martin Fowler', 50.00, 3, 1999),
  ( 'Database Design Principles', 'Jane Smith', 20.00, 0, 2018);

INSERT INTO customers (name, email, joined_date)
VALUES
  ('Alice', 'alice@email.com', '2023-01-10'),
  ('Bob', 'bob@email.com', '2022-05-15'),
  ('Charlie', 'charlie@email.com', '2023-06-20');


INSERT INTO orders (customer_id, book_id, quantity, order_date)
VALUES
  (1, 2, 1, '2024-03-10'),
  (2, 1, 1, '2024-02-20'),
  (1, 3, 2, '2024-03-05');


SELECT * FROM books;
SELECT * FROM customers;
SELECT * FROM orders;

-- 1️⃣ Find books that are out of stock.
SELECT title FROM books
WHERE stock=0;

-- 2️⃣ Retrieve the most expensive book in the store.
-- SELECT MAX(price) FROM books;

SELECT * FROM books
WHERE price = (SELECT MAX(price) FROM books);


-- 3️⃣ Find the total number of orders placed by each customer.
SELECT name ,count(name) as total_orders FROM orders
    JOIN customers ON orders.customer_id = customers.id
    GROUP BY name;

-- SELECT * from orders
-- JOIN customers USING(customer_id); doesnot contain same name on both table

-- 4️⃣ Calculate the total revenue generated from book sales.
SELECT sum(quantity*price) as total_revenue FROM orders
    JOIN books ON orders.book_id = books.id;

-- 5️⃣ List all customers who have placed more than one order.
SELECT name,count(name) as orders_count  FROM orders
    JOIN customers ON orders.customer_id = customers.id
    GROUP BY name
    HAVING count(name) > 1;             -- where doesnot work with aggregate function having used with aggregate


-- 6️⃣ Find the average price of books in the store.
SELECT round(avg(price),2) as avg_book_price FROM books;


-- 7️⃣ Increase the price of all books published before 2000 by 10%.
UPDATE books
SET price = price + (price * 0.10)
WHERE published_year < 2000;
-- SELECT * FROM books;

-- 8️⃣ Delete customers who haven't placed any orders.
  DELETE FROM customers
    WHERE id not in (SELECT customer_id FROM orders);