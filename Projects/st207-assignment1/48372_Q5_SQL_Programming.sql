--Q5.1:
SELECT c.email,c.name,o.order_number,o.order_date,o.grand_total,
STRING_AGG(p.short_name, ', ') AS list_of_product_names

FROM customer as c
JOIN orders as o ON c.email = o.email
JOIN ordered_item as oi ON o.order_number = oi.order_number
JOIN product as p ON oi.product_number = p.product_number
GROUP BY o.order_number, c.email, c.name, o.order_date, o.grand_total


--Q5.2:
SELECT DISTINCT c.email, c.name, c.birthdate, 
MAX(gc.current_balances) AS current_balance_on_giftcard,
STRING_AGG(p.short_name, ', ') AS list_of_product_names

FROM wishlist AS wl
LEFT JOIN product AS p ON p.wishlist_id = wl.wishlist_id
LEFT JOIN customer AS c ON c.email = wl.email
LEFT JOIN payment_method AS pm ON pm.email = c.email
LEFT JOIN gift_card AS gc ON gc.payment_method_id = pm.payment_method_id

GROUP BY c.email;


--Q5.3:
WITH RankedProducts AS
(   SELECT 
        c.category_type,
        p.short_name,
        SUM(oi.ordered_quantity) AS total_sales,
        ROW_NUMBER() OVER (PARTITION BY c.category_type ORDER BY SUM(oi.ordered_quantity) DESC) AS rank
    
    FROM ordered_item oi
    JOIN product p ON oi.product_number = p.product_number
    JOIN category c ON p.category_id = c.category_id

    GROUP BY 
        c.category_type, p.short_name
)

SELECT category_type, short_name, total_sales
FROM RankedProducts
WHERE rank <= 2
ORDER BY category_type, total_sales DESC;


--Q5.4:
WITH monthlysales AS
(   SELECT 
        strftime('%Y', o.order_date) AS year,
        strftime('%m', o.order_date) AS month,
        SUM(o.grand_total) - COALESCE(SUM(r.refund_total), 0) AS total_sales
    
    FROM orders o
    LEFT JOIN return r ON o.order_number = r.order_number AND r.return_status = 'Completed'

    GROUP BY year, month
),

salesgrowth AS
(   SELECT 
        year,
        month,
        total_sales,
        LAG(total_sales) OVER (ORDER BY year, month) AS previous_month_sales
    FROM 
        monthlysales
)

SELECT 
    year,
    month,
    total_sales,
    ROUND((total_sales - COALESCE(previous_month_sales, 0)) / NULLIF(previous_month_sales, 0) * 100, 2) AS sales_growth
FROM 
    salesgrowth
ORDER BY 
    year, month;

