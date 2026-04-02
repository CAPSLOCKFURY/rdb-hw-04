USE db_hw_03;

-- p1
SELECT COUNT(*)
FROM order_details od
         INNER JOIN orders o ON od.order_id = o.id
         INNER JOIN customers c ON o.customer_id = c.id
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
         INNER JOIN employees e ON o.employee_id = e.employee_id
         INNER JOIN shippers sh ON o.shipper_id = sh.id
         INNER JOIN suppliers sup ON p.supplier_id = sup.id;

SELECT COUNT(*)
FROM customers c
         LEFT JOIN orders o ON c.id = o.customer_id
         LEFT JOIN order_details od ON o.id = od.order_id
         LEFT JOIN products p ON od.product_id = p.id
         LEFT JOIN categories cat ON p.category_id = cat.id
         LEFT JOIN employees e ON o.employee_id = e.employee_id
         LEFT JOIN shippers sh ON o.shipper_id = sh.id
         LEFT JOIN suppliers sup ON p.supplier_id = sup.id;

-- p2
SELECT
    cat.name AS category_name,
    COUNT(*) AS row_count,
    AVG(od.quantity) AS avg_quantity
FROM order_details od
         INNER JOIN orders o ON od.order_id = o.id
         INNER JOIN customers c ON o.customer_id = c.id
         INNER JOIN products p ON od.product_id = p.id
         INNER JOIN categories cat ON p.category_id = cat.id
         INNER JOIN employees e ON o.employee_id = e.employee_id
         INNER JOIN shippers sh ON o.shipper_id = sh.id
         INNER JOIN suppliers sup ON p.supplier_id = sup.id
WHERE o.employee_id > 3 AND o.employee_id <= 10
GROUP BY cat.name
HAVING avg_quantity > 21
ORDER BY row_count DESC
LIMIT 4 OFFSET 1;