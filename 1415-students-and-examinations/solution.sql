# Write your MySQL query statement below
# Students 테이블에서 student_id를 가져오고 Subjects에서 subject_name을 가져옴
# Examinations 테이블은 student_id를 매칭해야 하는데 여기서 student_id별 subject_name을 GROUP_BY 해서 옆에 붙인다
# 서브쿼리가 필요할 것 같다

SELECT s.student_id,
       s.student_name,
       sub.subject_name,
       COUNT(e.subject_name) AS attended_exams
FROM Students AS s
CROSS JOIN Subjects AS sub
LEFT JOIN Examinations AS e
 ON s.student_id = e.student_id
 AND sub.subject_name = e.subject_name
 GROUP BY s.student_id, s.student_name, sub.subject_name
 ORDER BY s.student_id, sub.subject_name
 
 
