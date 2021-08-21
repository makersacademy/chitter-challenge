POSTGRES

development enviroment
CREATE DATABASE chitter ENCODING 'UTF8'

test enviroment
CREATE DATABASE chitter_test ENCODING 'UTF8'

development/test enviroment
CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    mail VARCHAR(40) NOT NULL,
    password VARCHAR(40),
    name VARCHAR(100) NOT NULL,
    user VARCHAR(30) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL default current_timestamp 
)
