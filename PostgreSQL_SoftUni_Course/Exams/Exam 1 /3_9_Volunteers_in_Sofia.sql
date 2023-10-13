SELECT
    v.name,
    v.phone_number,
    SPLIT_PART(v.address, ',', 2) AS address_in_sofia
FROM
    volunteers AS v
JOIN
    volunteers_departments AS vd
    ON v.department_id = vd.id
WHERE
    vd.department_name = 'Education program assistant'
    AND POSITION('Sofia' IN v.address) > 0
ORDER BY
    v.name ASC;
