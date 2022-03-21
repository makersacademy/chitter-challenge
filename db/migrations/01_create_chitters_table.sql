CREATE TABLE chitter_posts(id SERIAL PRIMARY KEY, post VARCHAR(280));
ALTER TABLE chitter_posts ADD time VARCHAR(30);

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name VARCHAR(60), last_name VARCHAR(60), email VARCHAR(60), username VARCHAR(60), password VARCHAR(60));
