# Sets up Users table
CREATE TABLE users (
    id SERIAL,
    username VARCHAR(60),
    email VARCHAR(60),
    password VARCHAR(140),
    PRIMARY KEY (id));
