DROP TABLE peeps;
DROP TABLE users;

-- Users Table
CREATE TABLE users(
id SERIAL, 
username text,
 email text,
 password text,
 PRIMARY KEY (id)
);

-- Peeps Table
CREATE TABLE peeps(
id SERIAL, 
content text,
 date timestamp,
 user_id int,
 PRIMARY KEY (id),
 CONSTRAINT fk FOREIGN KEY(user_id)
 REFERENCES users(id)
 ON DELETE CASCADE
);

TRUNCATE TABLE users, peeps RESTART IDENTITY;

-- Users Table
INSERT INTO users(username, email, password) VALUES('pmonson1', 'parismonson@yahoo.com', 'hash_password');
INSERT INTO users(username, email, password) VALUES('tessa34', 'tessa34@yahoo.com', 'hash_password');
-- Peeps Table
INSERT INTO peeps(content, date, user_id) VALUES('some text', '1999-01-08 04:05:06', 1);
INSERT INTO peeps(content, date, user_id) VALUES('some more text', '1999-01-08 04:05:06', 1);




