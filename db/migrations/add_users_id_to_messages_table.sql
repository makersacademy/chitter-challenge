
ALTER TABLE messages ADD COLUMN user_id INTEGER REFERENCES users(id);