CREATE TABLE users(id SERIAL PRIMARY KEY, name VARCHAR(140), username VARCHAR(140), email VARCHAR(60), password VARCHAR(140), user_id INTEGER REFERENCES chits (id));
