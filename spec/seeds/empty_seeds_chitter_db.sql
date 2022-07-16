DROP TABLE IF EXISTS peeps;
DROP TABLE IF EXISTS users;
--CREATE SEQUENCE IF NOT EXISTS peeps_id_seq;
--CREATE SEQUENCE IF NOT EXISTS users_id_seq;



CREATE TABLE users(
  id SERIAL,
  username text,
  password text,
  PRIMARY KEY ("id")
);
TRUNCATE TABLE users RESTART IDENTITY;

CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content text,
  author_id int,
  time_posted text ,
  constraint fk_users foreign key(author_id) references users(id)
);

TRUNCATE TABLE peeps RESTART IDENTITY;
