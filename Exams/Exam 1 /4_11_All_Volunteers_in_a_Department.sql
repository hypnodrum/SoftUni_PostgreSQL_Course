CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INTEGER AS $$
DECLARE
    volunteer_count INTEGER;
BEGIN
    SELECT COUNT(*) INTO volunteer_count
    FROM volunteers
    WHERE department_id = (SELECT id FROM volunteers_departments WHERE department_name = searched_volunteers_department);

    RETURN volunteer_count;
END;
$$ LANGUAGE plpgsql;
