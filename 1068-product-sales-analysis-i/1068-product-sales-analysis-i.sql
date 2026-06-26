# Write your MySQL query statement below
SELECT product_name, s.year, s.price
FROM Product p
JOIN Sales s 
ON p.product_id = s.product_id