 #Write your MySQL query statement below
SELECT p.product_id,
CASE WHEN SUM(CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date
    THEN u.units ELSE 0 END)=0 THEN 0
ELSE ROUND(SUM(CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN p.price * u.units ELSE 0 END)/SUM(CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN u.units END),2) END AS average_price
FROM Prices AS p
LEFT JOIN UnitsSold AS u
ON p.product_id=u.product_id
GROUP BY p.product_id


