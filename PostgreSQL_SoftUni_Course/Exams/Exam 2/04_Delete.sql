DELETE FROM clients
WHERE id NOT IN (SELECT DISTINCT client_id FROM courses)
  AND LENGTH(full_name) > 3;