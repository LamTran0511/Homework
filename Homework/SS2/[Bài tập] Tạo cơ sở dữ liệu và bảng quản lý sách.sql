create database LibraryDB;
create schema library;
CREATE TABLE library.Books
(
    book_id        BIGSERIAL PRIMARY KEY,
    title          VARCHAR(100) NOT NULL,
    author         VARCHAR(50)  NOT NULL,
    published_year INT,
    price          DECIMAL(10, 2)
);
select * from library.Books;