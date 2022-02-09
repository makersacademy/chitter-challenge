CREATE TABLE chitter (id SERIAL PRIMARY KEY, name VARCHAR(240), post VARCHAR(280), author_email VARCHAR(60), author_name VARCHAR(60), author_id INTEGER REFERENCES users (id))

