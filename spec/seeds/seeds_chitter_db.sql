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


INSERT INTO users("username", "password") VALUES
('Joe', '123'),
('Joseph', 'Thisismypassword');

CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  content text,
  author_id int,
  time_posted text ,
  constraint fk_users foreign key(author_id) references users(id)
);

TRUNCATE TABLE peeps RESTART IDENTITY;
INSERT INTO peeps("content","author_id","time_posted") VALUES
('This is post num 1', 1, '2020-05-12 14:13:30'),
('This is second post', 2,'2022-07-16 15:13:00');
