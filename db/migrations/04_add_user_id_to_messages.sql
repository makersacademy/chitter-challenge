ALTER TABLE peeps 
ADD COLUMN user_id INT;


ALTER TABLE peeps 
ADD FOREIGN KEY (user_id) REFERENCES users(id);