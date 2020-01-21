CREATE TABLE users(user_id SERIAL PRIMARY KEY, username VARCHAR(60), email VARCHAR(60), password_hash VARCHAR(60), display_name VARCHAR(60));

CREATE TABLE messages(message_id SERIAL PRIMARY KEY, text VARCHAR(160), user_id_fkey INTEGER REFERENCES users(user_id), date_added TIMESTAMP DEFAULT NOW());

CREATE TABLE comments(comment_id SERIAL PRIMARY KEY, text VARCHAR(160), user_id_fkey INTEGER REFERENCES users(user_id), message_id_fkey INTEGER REFERENCES messages(message_id), date_added TIMESTAMP DEFAULT NOW());

CREATE TABLE tags(tag_id SERIAL PRIMARY KEY, tag VARCHAR(160));

CREATE TABLE tags_messages_comments(tag_message_id SERIAL PRIMARY KEY, message_id_fkey INTEGER REFERENCES messages(message_id), comment_id_fkey INTEGER REFERENCES comments(comment_id));
