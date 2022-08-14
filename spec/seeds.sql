DROP TABLE IF EXISTS users, peeps; 

-- Table Definition
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp with time zone,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users ("email", "password", "name", "username") VALUES
('nschlosser@hotmail.com', 'ABCD', 'Naomi Schlösser', 'nschlosser'),
('hholmens@gmail.com', 'EFGH', 'Hanna Holmens', 'hhol91'),
('jjohn_88@yahoo.com', '1234', 'John Johnson', 'john_1')

INSERT INTO peeps ("content", "time", "user_id") VALUES
('Good morning everyone!', '2022-08-10 10:46:45.558437 +0100', '1'),
('Just testing out writing a peep', '2022-08-11 17:02:45.558437 +0010', '2')
('I have has a great day today', '2022-08-12 19:30:45.558437 +0010', '1')