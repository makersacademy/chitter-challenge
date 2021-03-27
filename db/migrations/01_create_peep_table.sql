Two databases: chitter and chitter_test

CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(240), date DATE, time TIME, user_id INTEGER, FOREIGN KEY (user_id) REFERENCES users (id)
);
CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(100), name VARCHAR(30));
