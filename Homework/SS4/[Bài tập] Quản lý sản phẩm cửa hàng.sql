create database quanlycuahang;
create schema quanlycuahangschema;
CREATE TABLE products
(
    id       SERIAL PRIMARY KEY,
    name     VARCHAR(50),
    category VARCHAR(50),
    price    DECIMAL(10, 2),
    stock    INT
);

INSERT INTO products (name, category, price, stock)
VALUES ('Laptop Dell', 'Electronics', 1500.00, 5),
       ('Chuột Logitech', 'Electronics', 25.50, 50),
       ('Bàn phím Razer', 'Electronics', 120.00, 20),
       ('Tủ lạnh LG', 'Home Appliances', 800.00, 3),
       ('Máy giặt Samsung', 'Home Appliances', 600.00, 2);
INSERT INTO products (name, category, price, stock)
VALUES ('Điều hòa Panasonic', 'Home Appliances', 400.00, 10);
UPDATE products set stock = 7 where name = 'Laptop Dell';
DELETE from products where stock = 0;
SELECT * from products order by price ASC;
SELECT DISTINCT category from products;
SELECT * from products where price between 100 and 1000;
SELECT * from products where name ilike '%LG%' or name ilike '%Samsung%';
SELECT * FROM products ORDER BY price DESC LIMIT 2;
