CREATE TABLE messages (id SERIAL PRIMARY KEY, message VARCHAR, time_now TIMESTAMP, user_id INTEGER REFERENCES users (id));
