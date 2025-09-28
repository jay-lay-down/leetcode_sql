SELECT s.user_id,
 ROUND(CASE WHEN COUNT(c.action) = 0 THEN 0
 ELSE (SUM(CASE WHEN(c.action)='confirmed' THEN 1 ELSE 0 END) * 1.0) 
 /SUM(CASE WHEN c.action = 'confirmed' OR c.action = 'timeout' THEN 1 ELSE 0 END) 
 END,2) AS confirmation_rate
FROM Signups AS s
LEFT JOIN Confirmations AS c
ON s.user_id = c.user_id
GROUP BY s.user_id

