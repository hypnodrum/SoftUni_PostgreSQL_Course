-- Create addresses table
CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Create categories table
CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(10) NOT NULL
);

-- Create clients table
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20) NOT NULL
);

-- Create drivers table
CREATE TABLE drivers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INTEGER NOT NULL CHECK (age > 0),
    rating NUMERIC(3, 2) DEFAULT 5.5
);

-- Create cars table
CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    make VARCHAR(20) NOT NULL,
    model VARCHAR(20),
    year INTEGER DEFAULT 0 CHECK (year >= 0),
    mileage INTEGER DEFAULT 0,
    condition CHAR(1) NOT NULL,
    category_id INTEGER NOT NULL REFERENCES categories(id) ON DELETE CASCADE
);

-- Create courses table
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    from_address_id INTEGER NOT NULL REFERENCES addresses(id) ON DELETE CASCADE,
    start TIMESTAMP NOT NULL,
    bill NUMERIC(12, 2) DEFAULT 10.0 CHECK (bill > 0),
    car_id INTEGER NOT NULL REFERENCES cars(id) ON DELETE CASCADE,
    client_id INTEGER NOT NULL REFERENCES clients(id) ON DELETE CASCADE
);

-- Create cars_drivers table for many-to-many relationship
CREATE TABLE cars_drivers (
    car_id INTEGER NOT NULL REFERENCES cars(id) ON DELETE CASCADE,
    driver_id INTEGER NOT NULL REFERENCES drivers(id) ON DELETE CASCADE,
    PRIMARY KEY (car_id, driver_id)
);
