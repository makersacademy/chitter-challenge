CREATE TABLE chitter_users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, username VARCHAR(60) UNIQUE, name VARCHAR(60), password VARCHAR(60));
