CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password_hash VARCHAR(60), display_name VARCHAR(60));

CREATE TABLE messages(id SERIAL PRIMARY KEY, text VARCHAR(160), user_id_fkey INTEGER REFERENCES users(id), timestamp TIMESTAMP);

CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(160), fk_user_id INTEGER REFERENCES users(id), message_id_fkey INTEGER REFERENCES messages(id), timestamp TIMESTAMP);

CREATE TABLE tags(id SERIAL PRIMARY KEY, tag VARCHAR(160));

CREATE TABLE tags_messages_comments(id SERIAL PRIMARY KEY, message_id_fkey INTEGER REFERENCES messages(id), comment_id_fkey INTEGER REFERENCES comments(id));
