CREATE TABLE messages (id SERIAL PRIMARY KEY, message_text VARCHAR, message_time TIMESTAMP, user_id INTEGER REFERENCES users (id));
