ALTER TABLE peeps ADD COLUMN user_id INTEGER;
ADD CONSTRAINT fk_peeps_users FOREIGN KEY (user_id) REFERENCES users (id);
