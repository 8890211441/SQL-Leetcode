# Write your MySQL query statement below
WITH friend_list AS (
    SELECT requester_id AS id
    FROM RequestAccepted

    UNION ALL

    SELECT accepter_id AS id
    FROM RequestAccepted
),
friend_count AS (
    SELECT id,
    COUNT(*) AS num
    FROM friend_list
    GROUP BY id
),
ranking AS (
    SELECT id,
    num,
    ROW_NUMBER() OVER(ORDER BY num DESC) AS rn
    FROM friend_count
)

SELECT id,
 num
FROM ranking
WHERE rn = 1;