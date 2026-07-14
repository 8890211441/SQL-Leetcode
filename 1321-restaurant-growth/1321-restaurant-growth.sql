WITH daily_amount AS (
SELECT
visited_on,
SUM(amount) AS amount
FROM Customer
GROUP BY visited_on
),
temp AS (
SELECT
visited_on,
SUM(amount) OVER (
ORDER BY visited_on
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS amount,
ROUND(
SUM(amount) OVER (
ORDER BY visited_on
ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) / 7, 2
) AS average_amount,
COUNT(*) OVER (
ORDER BY visited_on
 ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS cnt
FROM daily_amount
)
SELECT
visited_on,
amount,
average_amount
FROM temp
WHERE cnt = 7
ORDER BY visited_on;