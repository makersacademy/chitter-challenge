ALTER TABLE peeps ADD COLUMN user_id INTEGER;
ALTER TABLE peeps ADD CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id);
