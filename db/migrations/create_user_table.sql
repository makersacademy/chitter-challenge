-- Creating user table:
CREATE TABLE users(id SERIAL PRIMARY KEY, username VARCHAR(20), name VARCHAR(50), email VARCHAR(200), password VARCHAR(250));

-- Creating peeps table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, time_created DATETIME DEFAULT now(), peep_body VARCHAR(500), user_id int);
-- Add FOREIGN KEY for users to peeps table
ALTER TABLE peeps ADD FOREIGN KEY (user_id) REFERENCES users(id);
