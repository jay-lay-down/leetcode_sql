# Write your MySQL query statement below
# employee_id = primary key, and experience_years x NULL

SELECT p.project_id,
 ROUND(avg(experience_years),2) AS average_years
 FROM Project as p
 JOIN Employee as e
ON p.employee_id = e.employee_id
GROUP BY p.project_id

