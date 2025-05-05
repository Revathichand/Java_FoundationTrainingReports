SELECT name, contact_info
FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Orders
);

SELECT COUNT(*) AS total_products
FROM Products;


SELECT SUM(quantity * price) AS total_revenue
FROM OrderDetails;


SELECT AVG(od.quantity) AS avg_quantity
FROM OrderDetails od
JOIN Products p ON od.product_id = p.product_id
JOIN Categories c ON p.category_id = c.category_id
WHERE c.category_name = 'Smartphones';  -- Replace with user input


SELECT SUM(od.quantity * od.price) AS customer_revenue
FROM Orders o
JOIN OrderDetails od ON o.order_id = od.order_id
WHERE o.customer_id = 101;  -- Replace with user input

SELECT name, order_count
FROM (
    SELECT c.name, COUNT(o.order_id) AS order_count
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    GROUP BY c.name
) AS customer_orders
ORDER BY order_count DESC
LIMIT 1;

SELECT category_name, total_quantity
FROM (
    SELECT c.category_name, SUM(od.quantity) AS total_quantity
    FROM OrderDetails od
    JOIN Products p ON od.product_id = p.product_id
    JOIN Categories c ON p.category_id = c.category_id
    GROUP BY c.category_name
) AS category_totals
ORDER BY total_quantity DESC
LIMIT 1;

SELECT name, total_spent
FROM (
    SELECT c.name, SUM(od.quantity * od.price) AS total_spent
    FROM Customers c
    JOIN Orders o ON c.customer_id = o.customer_id
    JOIN OrderDetails od ON o.order_id = od.order_id
    GROUP BY c.name
) AS spending
ORDER BY total_spent DESC
LIMIT 1;

SELECT 
    (SELECT SUM(quantity * price) FROM OrderDetails) / 
    (SELECT COUNT(*) FROM Orders) AS avg_order_value;

SELECT c.name, COUNT(o.order_id) AS order_count
FROM Customers c
LEFT JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
