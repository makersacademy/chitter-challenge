-- ALTER TABLE peep_messages
-- ADD COLUMN user_id int,
-- ADD FOREIGN KEY (user_id) REFERENCES Users(id);

ALTER TABLE peep_messages
ADD COLUMN username VARCHAR(60);