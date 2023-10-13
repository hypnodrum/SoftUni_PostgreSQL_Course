CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20))
RETURNS INTEGER AS $$
DECLARE
  course_count INTEGER;
BEGIN
  SELECT COUNT(*)
  INTO course_count
  FROM courses
  WHERE client_id = (SELECT id FROM clients WHERE phone_number = phone_num);

  RETURN course_count;
END;
$$ LANGUAGE plpgsql;