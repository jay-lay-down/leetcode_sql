# Write your MySQL query statement below
# 일단 액티비티 타입은 start, end 그리고 프로세스 아이디는 0,1이 있음
# 그러니까 0 & start, 0 & end, 1 & start, 1 & end가 있음
# 그 후에 머신아이디는 저 네 개의 단계가 끝나면 +1이 됨
# 여기서 내가 구할 거는 머신아이디랑 timestamp를 통해 평균을 구하면 되는데
# 예를 들어 0 start 0 end의 차이를 구하고 1 start 1 end 차이를 구한 다음에 2로 나누면 됨 

SELECT machine_id,
       ROUND(AVG(process_time),3) AS processing_time
FROM (
      SELECT machine_id,
             process_id,
             MAX(CASE WHEN activity_type='end' THEN timestamp END) - 
             MAX(CASE WHEN activity_type='start' THEN timestamp END) AS process_time
    FROM Activity 
    GROUP BY machine_id, process_id) t
GROUP BY machine_id;
