ALTER TABLE peeps ADD user_id INT NOT NULL;

ALTER TABLE peeps
ADD CONSTRAINT constraint_fk FOREIGN KEY (user_id) REFERENCES users (user_id);
