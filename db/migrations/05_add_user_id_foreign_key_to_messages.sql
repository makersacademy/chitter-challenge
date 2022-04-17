ALTER TABLE peeps 
ADD FOREIGN KEY (user_id) REFERENCES users(id);