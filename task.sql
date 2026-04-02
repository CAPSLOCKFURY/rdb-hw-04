CREATE DATABASE IF NOT EXISTS rdb_hw_04;
USE rdb_hw_04;

-- b) Таблиця "authors"
CREATE TABLE authors (
                         author_id INT AUTO_INCREMENT PRIMARY KEY,
                         author_name VARCHAR(255) NOT NULL
);

-- c) Таблиця "genres"
CREATE TABLE genres (
                        genre_id INT AUTO_INCREMENT PRIMARY KEY,
                        genre_name VARCHAR(100) NOT NULL
);

-- d) Таблиця "books"
CREATE TABLE books (
                       book_id INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       publication_year YEAR,
                       author_id INT,
                       genre_id INT,
                       FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL,
                       FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE SET NULL
);

-- e) Таблиця "users"
CREATE TABLE users (
                       user_id INT AUTO_INCREMENT PRIMARY KEY,
                       username VARCHAR(100) NOT NULL,
                       email VARCHAR(255) UNIQUE NOT NULL
);

-- f) Таблиця "borrowed_books"
CREATE TABLE borrowed_books (
                                borrow_id INT AUTO_INCREMENT PRIMARY KEY,
                                book_id INT,
                                user_id INT,
                                borrow_date DATE NOT NULL,
                                return_date DATE,
                                FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE,
                                FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

INSERT INTO authors (author_name) VALUES
                                      ('Джордж Орвелл'),
                                      ('Джоан Роулінг');

-- Додаємо жанри
INSERT INTO genres (genre_name) VALUES
                                    ('Антиутопія'),
                                    ('Фентезі');

-- Додаємо книги
INSERT INTO books (title, publication_year, author_id, genre_id) VALUES
                                                                     ('1984', 1949, 1, 1),
                                                                     ('Гаррі Поттер і філософський камінь', 1997, 2, 2);

-- Додаємо користувачів
INSERT INTO users (username, email) VALUES
                                        ('ivan_reader', 'ivan@example.com'),
                                        ('anna_student', 'anna@example.com');

-- Додаємо інформацію про видані книги
INSERT INTO borrowed_books (book_id, user_id, borrow_date, return_date) VALUES
                                                                            (1, 1, '2023-10-01', '2023-10-15'),
                                                                            (2, 2, '2023-10-05', NULL); -- NULL означає, що книгу ще не повернули
