CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(140));
ALTER TABLE peeps ADD timestamp timestamp with time zone;
CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(60));