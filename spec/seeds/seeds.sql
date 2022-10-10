TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.



INSERT INTO users (username, email, password) VALUES ('maker52', 'abc@gmail.com', 'abc123');
INSERT INTO users (username, email, password) VALUES ('iphone49', 'xyz@gmail.com', 'xyz123');


INSERT INTO peeps (content, date_time, user_id) VALUES ('just ate some chips', '2022-10-07 16:36:08.615435 +010', 1);
INSERT INTO peeps (content, date_time, user_id) VALUES ('anniversary day', '2022-10-07 16:37:20.82639 +0100 ', 2);

-- this is from a diff project I was working on

-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   username text,
--   email text,
--   password text
-- );

-- CREATE TABLE peeps (
--   id SERIAL PRIMARY KEY,
--   content text,
--   date_time text,
--   user_id int,
--   constraint fk_user foreign key(user_id)
--     references users(id)
--     on delete cascade
-- );