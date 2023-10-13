UPDATE board_games SET publisher_id = 1 WHERE publisher_id IN (SELECT id FROM publishers WHERE address_id IN (SELECT id FROM addresses WHERE town LIKE 'L%'));

UPDATE publishers SET address_id = 1 WHERE address_id IN (SELECT id FROM addresses WHERE town LIKE 'L%');

DELETE FROM addresses WHERE town LIKE 'L%';
