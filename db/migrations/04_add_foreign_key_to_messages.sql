ALTER TABLE users 
RENAME COLUMN id TO user_id;

ALTER TABLE users 
RENAME COLUMN user_id TO id;


-- ALTER TABLE messages ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users (user_id)  MATCH FULL;