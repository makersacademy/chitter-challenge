DROP TABLE IF EXISTS "peeps_users";
DROP TABLE IF EXISTS "peeps";
DROP TABLE IF EXISTS "users";

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text NOT NULL UNIQUE,
  password text NOT NULL,
  name text,
  username text NOT NULL UNIQUE
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  timestamp timestamp,
  user_id int,
  peep_id int,
  constraint fk_user foreign key(user_id) references users(id),
  constraint fk_peep foreign key(peep_id) references peeps(id)
);

CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id),
  constraint fk_user foreign key(user_id) references users(id),
  PRIMARY KEY (peep_id, user_id)
);

TRUNCATE TABLE users, peeps, peeps_users RESTART IDENTITY;

INSERT INTO users (email, password, name, username) VALUES ('hello@gmail.com', 'password', 'Bob', 'bob678'), 
('fred@gmail.com', '$2a$12$7NbikxOM4OU25bN0CT/lxevYcjDFnJzzReisBY6PUObEvmYEpy3hG', 'Fred', 'freddo');

INSERT INTO peeps (message, timestamp, user_id, peep_id) VALUES
('Hello world', '2023-04-28 12:45:05', 1, null),
('This is a great peep', '2023-05-03 16:23:34', 2, null),
('This is a reply to the great peep', '2023-05-02 11:01:25', 1, 2),
('I am tagging Bob', '2023-05-01 16:23:35', 2, null);

INSERT INTO peeps_users (peep_id, user_id) VALUES
(4, 1);