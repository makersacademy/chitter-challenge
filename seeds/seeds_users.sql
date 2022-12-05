TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES ('Bob', 'user1', 'bob@gmail.com', 'password1');
INSERT INTO users (name, username, email, password) VALUES ('Alex', 'user2', 'alex@gmail.com', 'password2');