-- Create the procedure
CREATE OR REPLACE PROCEDURE sp_animals_with_owners_or_not(
    IN animal_name VARCHAR(30),
    OUT owner_name TEXT
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT
        COALESCE(o."name", 'For adoption')
    INTO
        owner_name
    FROM
        animals AS a
    LEFT JOIN
        owners AS o
        ON
        a.owner_id = o."id"
    WHERE
        a."name" = animal_name;
END;
$$;

-- Call the procedure
CALL sp_animals_with_owners_or_not('Pumpkinseed Sunfish', '');
CALL sp_animals_with_owners_or_not('Hippo', '');
CALL sp_animals_with_owners_or_not('Brown bear', '');
