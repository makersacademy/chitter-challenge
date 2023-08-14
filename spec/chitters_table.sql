DROP TABLE IF EXISTS chitters;
DROP TABLE IF EXISTS users;

CREATE TABLE chitters (
  id SERIAL PRIMARY KEY,
  peep text,
  created_at timestamp,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  name text,
  username text
);

TRUNCATE TABLE chitters RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (email, password, name, username) VALUES ('samm@makersacademy.com', 'password123', 'Sam Morgan', 'sjmog');
INSERT INTO users (email, password, name, username) VALUES ('chonky@chonkersacademy.com', 'birdwird', 'Samuel Morganson', 'smorg');
INSERT INTO users (email, password, name, username) VALUES ('sleepy@sleepersacademy.com', 'zzzzzz', 'Tony Harrison', 'TZ');

INSERT INTO chitters (peep, created_at, user_id) VALUES ('flying solo', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('falling', CURRENT_TIMESTAMP, 2);
INSERT INTO chitters (peep, created_at, user_id) VALUES ('dead', CURRENT_TIMESTAMP, 3);