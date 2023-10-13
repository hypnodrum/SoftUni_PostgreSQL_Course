-- Categories table
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

-- Addresses table
CREATE TABLE addresses (
  id SERIAL PRIMARY KEY,
  street_name VARCHAR(100) NOT NULL,
  street_number INT CHECK (street_number > 0) NOT NULL,
  town VARCHAR(30) NOT NULL,
  country VARCHAR(50) NOT NULL,
  zip_code INT CHECK (zip_code > 0) NOT NULL
);

-- Publishers table
CREATE TABLE publishers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  address_id INT NOT NULL,
  website VARCHAR(40),
  phone VARCHAR(20),
  CONSTRAINT fk_publishers_addresses FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE CASCADE
);

-- Players Ranges table
CREATE TABLE players_ranges (
  id SERIAL PRIMARY KEY,
  min_players INT CHECK (min_players > 0) NOT NULL,
  max_players INT CHECK (max_players > 0) NOT NULL
);

-- Creators table
CREATE TABLE creators (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  email VARCHAR(30) NOT NULL
);

-- Board Games table
CREATE TABLE board_games (
  id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  release_year INT CHECK (release_year > 0) NOT NULL,
  rating NUMERIC(10, 2) NOT NULL,
  category_id INT NOT NULL,
  publisher_id INT NOT NULL,
  players_range_id INT NOT NULL,
  CONSTRAINT fk_board_games_categories FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE,
  CONSTRAINT fk_board_games_publishers FOREIGN KEY (publisher_id) REFERENCES publishers(id) ON DELETE CASCADE,
  CONSTRAINT fk_board_games_players_ranges FOREIGN KEY (players_range_id) REFERENCES players_ranges(id) ON DELETE CASCADE
);

-- Creators Board Games mapping table
CREATE TABLE creators_board_games (
  creator_id INT NOT NULL,
  board_game_id INT NOT NULL,
  CONSTRAINT fk_creators_board_games_creators FOREIGN KEY (creator_id) REFERENCES creators(id) ON DELETE CASCADE,
  CONSTRAINT fk_creators_board_games_board_games FOREIGN KEY (board_game_id) REFERENCES board_games(id) ON DELETE CASCADE,
  PRIMARY KEY (creator_id, board_game_id)
);
