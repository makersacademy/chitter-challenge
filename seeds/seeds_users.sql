TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES ('David', 'username1', 'user.1@hotmail.com', 'password1');
INSERT INTO users (name, username, email, password) VALUES ('Anna', 'username2', 'user.2@hotmail.com', 'password2');