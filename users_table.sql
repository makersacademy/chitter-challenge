DROP TABLE IF EXISTS users;

-- Table Definition
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    username text,
    email text,
    password text,
    logged_in boolean
);
