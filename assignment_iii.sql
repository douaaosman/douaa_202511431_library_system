

CREATE TABLE authors (
    author_id SERIAL PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    genre VARCHAR(50) NOT NULL,
    published_year INT CHECK (published_year > 1500),
    author_id INT,
    CONSTRAINT fk_author FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

INSERT INTO authors (author_name, country) VALUES 
('Agatha Christie', 'UK'),
('J.K. Rowling', 'UK'),
('Stephen King', 'USA'),
('Dan Brown', 'USA'),
('Chimamanda Adichie', 'Nigeria');

INSERT INTO members (full_name, email, join_date) VALUES 
('Alice Smith', 'alice@gmail.com', '2026-01-10'),
('Bob Johnson', 'bob@yahoo.com', '2026-02-15'),
('Charlie Brown', 'charlie@outlook.com', '2026-03-01'),
('Diana Prince', 'diana@gmail.com', '2026-03-20'),
('Ethan Hunt', 'ethan@imf.org', '2026-04-05');

INSERT INTO books (title, genre, published_year, author_id) VALUES 
('The Murder of Roger Ackroyd', 'Mystery', 1926, 1),
('Harry Potter and the Sorcerer Stone', 'Fantasy', 1997, 2),
('The Shining', 'Horror', 1977, 3),
('The Da Vinci Code', 'Thriller', 2003, 4),
('Half of a Yellow Sun', 'Historical Fiction', 2006, 5);

SELECT title, genre FROM books;

SELECT * FROM books WHERE genre = 'Mystery';

SELECT * FROM members ORDER BY join_date DESC;

SELECT b.title, a.author_name, a.country 
FROM books b 
INNER JOIN authors a ON b.author_id = a.author_id;

SELECT a.author_name, b.title 
FROM authors a 
LEFT JOIN books b ON a.author_id = b.author_id;

SELECT b.title, b.genre, a.author_name, a.country 
FROM books b 
INNER JOIN authors a ON b.author_id = a.author_id 
WHERE b.published_year > 1990;

UPDATE members SET email = 'alice.new@gmail.com' WHERE member_id = 1;
SELECT * FROM members WHERE member_id = 1;

UPDATE books SET genre = 'Classic Mystery' WHERE genre = 'Mystery';
SELECT * FROM books WHERE genre = 'Classic Mystery';

UPDATE members SET join_date = '2026-01-01' WHERE join_date < '2026-02-01';
SELECT * FROM members;

ALTER TABLE books RENAME COLUMN genre TO book_genre;
SELECT * FROM books;

ALTER TABLE authors ALTER COLUMN country TYPE VARCHAR(100);

ALTER TABLE members ADD COLUMN phone_number VARCHAR(20) DEFAULT 'N/A';
SELECT * FROM members;

INSERT INTO authors (author_name, country) VALUES ('George Orwell', 'UK');

INSERT INTO members (full_name, email, join_date) VALUES 
('Fiona Gallagher', 'fiona@gmail.com', '2026-06-01'),
('George Martin', 'georgem@gmail.com', '2026-06-02');

INSERT INTO books (title, book_genre, published_year, author_id) 
VALUES ('1984', 'Dystopian', 1949, 6);
SELECT * FROM books WHERE author_id = 6;