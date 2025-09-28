# Write your MySQL query statement below
SELECT r.contest_id,
 ROUND(100.0*SUM(CASE WHEN r.user_id IS NOT NULL THEN 1 ELSE 0 END) /
 (SELECT SUM(1) FROM Users),2) AS percentage
 FROM Register AS r
 GROUP BY r.contest_id
 ORDER BY percentage DESC, r.contest_id ASC

