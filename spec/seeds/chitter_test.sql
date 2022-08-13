
-- -- Create the table without the foreign key first.
-- CREATE TABLE users (
--   id SERIAL PRIMARY KEY,
--   name text,
--   email text,
--   username text,
--   password text,
-- );

-- -- Then the table with the foreign key first.
-- CREATE TABLE peeps (
--   id SERIAL PRIMARY KEY,
--   content text,
--   date timestamp,
-- -- The foreign key name is always {other_table_singular}_id
--   user_id int,
--   constraint fk_user foreign key(user_id)
--     references users(id)
--     on delete cascade
-- );


TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("id", "name", "email", "username", "password") VALUES 
(1, 'Joe Bloggs', 'joe.bloggs@test.com', 'j_blog', 'test123'),
(2, 'Brijesh Pujara', 'brijesh@test.com', 'brij', 'test1234'),
(3, 'Elon Musk', 'elon@test.com', 'elon_m', 'musk1234');

INSERT INTO peeps ("content", "date", "user_id") VALUES 
('Gabriel Jesus to Arsenal confirmed!', '2022-05-13 07:15:31.123456789', 2 ),
('Hi all!', '2022-07-13 09:15:31.123456789', 1 ),
('Dodgecoin to the mooooon', '2022-01-12 17:15:31.123456789', 3 );