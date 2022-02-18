ALTER TABLE users RENAME id TO user_id;
ALTER TABLE peeps ADD COLUMN user_id INT NOT NULL;
ALTER TABLE peeps ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES users(user_id);
