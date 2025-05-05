SELECT o.order_id, o.order_date, c.name AS customer_name, c.contact_info
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;

SELECT p.product_name, SUM(od.quantity * od.price) AS total_revenue
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;


SELECT DISTINCT c.name, c.contact_info
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id;

SELECT p.product_name, SUM(od.quantity) AS total_quantity
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

SELECT p.product_name, cat.category_name
FROM Products p
JOIN Categories cat ON p.category_id = cat.category_id;

SELECT c.name AS customer_name, AVG(od_total.total_value) AS avg_order_value
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN (
    SELECT order_id, SUM(quantity * price) AS total_value
    FROM OrderDetails
    GROUP BY order_id
) od_total ON o.order_id = od_total.order_id
GROUP BY c.name;

SELECT o.order_id, c.name AS customer_name, c.contact_info, SUM(od.quantity * od.price) AS total_revenue
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
GROUP BY o.order_id, c.name, c.contact_info
ORDER BY total_revenue DESC
LIMIT 1;

SELECT p.product_name, COUNT(od.order_id) AS times_ordered
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
GROUP BY p.product_name;

-- Replace :product_name with actual input in application
SELECT DISTINCT c.name, c.contact_info
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN OrderDetails od ON o.order_id = od.order_id
JOIN Products p ON od.product_id = p.product_id
WHERE p.product_name = 'Laptop';  -- Replace 'Laptop' with your desired product

-- Replace :start_date and :end_date with actual input
SELECT SUM(od.quantity * od.price) AS total_revenue
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
WHERE o.order_date BETWEEN '2024-01-01' AND '2024-12-31';  -- Use actual dates




