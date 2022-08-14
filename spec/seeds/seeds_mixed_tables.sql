-- -- Table Definition
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name text,
--   username text,
--   email text,
--   password text
-- );


-- - CREATE TABLE peeps (
--   id SERIAL PRIMARY KEY,
--   content text,
--   date_time_created timestamp,
-- -- The foreign key name is always {other_table_singular}_id
--   user_id int,
--   constraint fk_user foreign key(user_id)
--     references users(id)
--     on delete cascade
-- );

TRUNCATE TABLE users, peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, username, email, password) VALUES
('John Isaac', 'JI2022', 'john@hotmail.com', 'password123'),
('Daniel Roma', 'BeatTheHeat', 'danny@gmail.com', 'admin'),
('Marky Mark', 'FunkyB', 'marky@yahoo.com', 'goodvibes'),
('Baby Yoda', 'mandoDisneyLover', 'yoda@starwars.com', 'jediking')
;

INSERT INTO peeps (content, date_time_created, user_id) VALUES
('I love cricket', '2022-08-11 18:16:04', 2),
('Anyone out there?', '2022-08-12 07:40:03', 4),
('Have you guys seen the new Marvel movie?', '2022-08-12 16:47:00', 1),
('Where are my tacos', '2022-08-12 20:15:20', 3)
;