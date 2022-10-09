ALTER TABLE peeps ADD user_id int;
ALTER TABLE peeps ADD FOREIGN KEY (user_id) REFERENCES users(id);