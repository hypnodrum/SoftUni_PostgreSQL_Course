SELECT
    a.name AS animal,
    EXTRACT(YEAR FROM a.birthdate) AS birth_year,
    at.animal_type
FROM
    animals a
JOIN
    animal_types at ON a.animal_type_id = at.id
WHERE
    a.owner_id IS NULL
AND
    at.animal_type != 'Birds'
AND
    a.birthdate >= '2017-01-01'
ORDER BY
    a.name ASC;