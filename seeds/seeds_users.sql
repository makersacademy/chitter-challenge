TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email, password, name, username, logged_in) VALUES ('andy@gmail.com', 'password', 'Andy', 'Andy1', FALSE);
INSERT INTO users (email, password, name, username, logged_in) VALUES ('bob@gmail.com', 'betterpassword', 'Bob', 'Bob99', FALSE);