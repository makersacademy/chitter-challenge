TRUNCATE TABLE users,posts RESTART IDENTITY CASCADE; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (email,password,name, username) VALUES 
('david@mail.com', '123','David','superdavid'),
('anna@mail.com','123','Anna','superanna');

INSERT INTO posts (title, content, create_at, user_id) VALUES 
('post01', 'content01','2017-05-25 17:39:49', 1),
('post02', 'content02','2018-05-25 17:39:49', 2),
('post03', 'content03','2018-06-25 17:39:49', 2);