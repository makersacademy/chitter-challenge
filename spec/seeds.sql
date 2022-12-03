DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email_address text,
  password text
);

DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_time timestamp DEFAULT CURRENT_TIMESTAMP,
-- The foreign key name is always {other_table_singular}_id
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE users RESTART IDENTITY CASCADE; -- replace with your own table name.
TRUNCATE TABLE peeps RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email_address, password) VALUES ('David', 'email_1@yahoo.co.uk', '##^%$&^$#');
INSERT INTO users (name, email_address, password) VALUES ('Anna', 'email_2@gmail.com', '#%%&^%££###');


-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO peeps (content, user_id) VALUES ('peep 1', 1);
INSERT INTO peeps (content, user_id) VALUES ('peep 2', 2);
INSERT INTO peeps (content, user_id) VALUES ('peep 3', 1);