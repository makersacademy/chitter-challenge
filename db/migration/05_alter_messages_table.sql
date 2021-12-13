-- adds a new column to connect to the users table through foreign key user id
ALTER TABLE messages ADD COLUMN user_id INTEGER REFERENCES users(id);