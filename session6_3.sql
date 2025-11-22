
-- Tìm các sản phẩm có giá nằm trong một khoảng cụ thể.
SELECT *
FROM products
WHERE price BETWEEN 100 AND 300;

-- Tìm các sản phẩm có tên chứa một chuỗi ký tự nhất định.
SELECT *
FROM products
WHERE ProductName LIKE '%pro%';

-- Tính giá trung bình của sản phẩm cho mỗi danh mục.
SELECT CategoryID, AVG(price) AS AveragePrice
FROM products
GROUP BY CategoryID;

-- Tìm những sản phẩm có giá cao hơn mức giá trung bình của toàn bộ sản phẩm.
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

-- Tìm sản phẩm có giá thấp nhất cho từng danh mục.
SELECT p.*
FROM products p
JOIN (
    SELECT CategoryID, MIN(price) AS MinPrice
    FROM products
    GROUP BY CategoryID
) x ON p.CategoryID = x.CategoryID AND p.price = x.MinPrice;