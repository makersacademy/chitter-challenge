CREATE TABLE peeps (id SERIAL PRIMARY KEY, text VARCHAR(240), date DATE, time TIME, user_id INTEGER, FOREIGN KEY (user_id) REFERENCES users (id)
);
CREATE TABLE users (id SERIAL PRIMARY KEY, username VARCHAR(15), password VARCHAR(10), name VARCHAR(30));
