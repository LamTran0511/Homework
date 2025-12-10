create database quanlycuahang;
create schema quanlycuahangschema;
set search_path to quanlycuahangschema;
CREATE TABLE products
(
    product_id   INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category     VARCHAR(50)  NOT NULL
);
INSERT INTO products (product_id, product_name, category)
VALUES (1, 'Laptop Dell', 'Electronics'),
       (2, 'iPhone 15', 'Electronics'),
       (3, 'Bàn học gỗ', 'Furniture'),
       (4, 'Ghế xoay', 'Furniture');
CREATE TABLE orders
(
    order_id    INT PRIMARY KEY,
    product_id  INT            NOT NULL,
    quantity    INT            NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);
INSERT INTO orders (order_id, product_id, quantity, total_price)
VALUES (101, 1, 2, 2200),
       (102, 2, 3, 3300),
       (103, 3, 5, 2500),
       (104, 4, 4, 1600),
       (105, 1, 1, 1100);
-- Viết truy vấn hiển thị tổng doanh thu (SUM(total_price)) và số lượng sản phẩm bán được (SUM(quantity)) cho từng nhóm danh mục (category)
-- Chỉ hiển thị những nhóm có tổng doanh thu lớn hơn 2000
-- Sắp xếp kết quả theo tổng doanh thu giảm dần
SELECT p.category,
       SUM(o.total_price) AS total_sales,
       SUM(o.quantity)    AS total_quantity
FROM orders o
         JOIN
     products p ON o.product_id = p.product_id
GROUP BY p.category
HAVING SUM(o.total_price) > 2000
ORDER BY total_sales DESC;
--
select p.product_name, sum(total_price) as total_revenue
from products p
         join orders o on p.product_id = o.product_id
group by p.product_name
having sum(total_price) >= all (select sum(total_price) as total_revenue
                                from products p
                                         join orders o on p.product_id = o.product_id
                                group by p.product_name);
--
SELECT p.category,
       SUM(o.total_price) AS category_total_revenue
FROM orders o
         JOIN
     products p ON o.product_id = p.product_id
GROUP BY p.category;
--
(SELECT p.category
 FROM products p
 WHERE p.product_id IN (SELECT product_id
                        FROM orders
                        GROUP BY product_id
                        ORDER BY SUM(total_price) DESC
                        LIMIT 1))

INTERSECT

(SELECT p.category
 FROM orders o
          JOIN
      products p ON o.product_id = p.product_id
 GROUP BY p.category
 HAVING SUM(o.total_price) > 3000);