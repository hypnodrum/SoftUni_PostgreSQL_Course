CREATE OR REPLACE FUNCTION fn_creator_with_board_games(p_first_name VARCHAR(30))
RETURNS INTEGER AS $$
DECLARE
    total_games INTEGER;
BEGIN
    SELECT COUNT(*)
    INTO total_games
    FROM creators AS c
    JOIN creators_board_games AS cbg ON c.id = cbg.creator_id
    WHERE c.first_name = p_first_name;

    RETURN total_games;
END;
$$ LANGUAGE plpgsql;
