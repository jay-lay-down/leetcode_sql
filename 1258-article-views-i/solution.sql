# Write your MySQL query statement below
SELECT v.viewer_id AS id
FROM Views AS v
WHERE v.viewer_id = v.author_id
GROUP BY id
ORDER BY id ASC
