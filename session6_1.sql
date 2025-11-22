CREATE DATABASE QLBH;
USE QLBH;

CREATE TABLE CATEGORIES (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL
);
CREATE TABLE PRODUCTS (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
price FLOAT NOT NULL,
category_id INT,
FOREIGN KEY (category_id) REFERENCES CATEGORIES(id)
);

-- Thêm 3 sản phẩm mới vào bảng products.
INSERT INTO PRODUCTS (name, price, category_id)
VALUES 
('Product A', 100, 1),
('Product B', 200, 2),
('Product C', 500, 1);

-- Cập nhật giá của một sản phẩm id = 2
UPDATE PRODUCTS SET price = 300 WHERE id = 2;

-- Xóa sản phẩm id = 3
DELETE FROM PRODUCTS WHERE id = 3;

-- Hiển thị tất cả sản phẩm, sắp xếp theo giá
SELECT * FROM PRODUCTS ORDER BY price ASC;
SELECT * FROM PRODUCTS ORDER BY price DESC;

-- Thống kê số lượng sản phẩm cho từng danh mục
SELECT c.name AS category_name, COUNT(p.id) AS total_products
FROM CATEGORIES c
LEFT JOIN PRODUCTS p
ON c.id = p.category_id
GROUP BY c.id, c.name;

-- Truy vấn lấy giá cao nhất và thấp nhất theo từng danh mục
SELECT c.name AS category_name,
MAX(p.price) AS max_price,
MIN(p.price) AS min_price
FROM CATEGORIES c
JOIN PRODUCTS p ON c.id = p.category_id
GROUP BY c.id, c.name;