CREATE TABLE users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
CREATE TABLE messages(id SERIAL PRIMARY KEY, user_id NUMERIC, content TEXT, time TIMESTAMP DEFAULT clock_timestamp());
