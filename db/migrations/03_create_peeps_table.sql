CREATE TABLE peeps(id SERIAL PRIMARY KEY, text VARCHAR(250), timestamp TIMESTAMP, user_id INTEGER REFERENCES users(id));
