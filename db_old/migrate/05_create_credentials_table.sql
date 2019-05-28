-- A next step approach - move credentials to a separate table

-- CREATE TABLE credentials
-- (
--   credentials_id int PRIMARY KEY,
--   username varchar(50),
--   user_password varchar(300),
--   FOREIGN KEY (credentials_id) REFERENCES users(id) ON DELETE CASCADE
-- );