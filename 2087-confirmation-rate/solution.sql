SELECT 
  user_id,
  CASE 
    WHEN c_conf + c_to = 0 THEN 0
    ELSE ROUND(c_conf / (c_conf + c_to), 2)
  END AS confirmation_rate
FROM (
  SELECT 
    s.user_id,
    COUNT(CASE WHEN c.action = 'confirmed' THEN 1 END) AS c_conf,
    COUNT(CASE WHEN c.action = 'timeout' THEN 1 END) AS c_to
  FROM Signups s
  LEFT JOIN Confirmations c ON s.user_id = c.user_id
  GROUP BY s.user_id
) AS stats
ORDER BY user_id;

