SELECT
    cl.full_name,
    COUNT(DISTINCT co.car_id) AS count_of_cars,
    SUM(co.bill) AS total_sum
FROM clients cl
JOIN courses co ON cl.id = co.client_id
WHERE SUBSTRING(cl.full_name, 2, 1) = 'a'
GROUP BY cl.full_name
HAVING COUNT(DISTINCT co.car_id) > 1
ORDER BY cl.full_name ASC;