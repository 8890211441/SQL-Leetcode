# Write your MySQL query statement below
WITH ranked_salary AS (
    SELECT
        e.name AS Employee,
        d.name AS Department,
        e.salary AS Salary,
        DENSE_RANK() OVER(
        PARTITION BY departmentId
        ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee e
    JOIN Department d
    ON e.departmentId = d.id
)
SELECT
Department,
Employee,
Salary
FROM ranked_salary
WHERE salary_rank <= 3;