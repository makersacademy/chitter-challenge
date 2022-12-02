TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email,password,name, username) VALUES ('david@mail.com', '123','David','superdavid');
INSERT INTO users (email,password,name, username) VALUES ('anna@mail.com','123','Anna',' superanna');