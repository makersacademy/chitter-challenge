CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text,
  username text,
  UNIQUE(username)
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp timestamp,
  name text,
  username text,
  user_id int,
  constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

INSERT INTO users (name, email, username, password) VALUES ('Alex', 'alexemail@test.com', 'iloveanimals391', 'password123');
INSERT INTO users (name, email, username, password) VALUES ('Zeus', 'zeusemail@test.com', 'habanerohotstuff', 'password123');

INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Now I know how lobsters feel :-(', '2022-08-13 12:00:00', 'Alex', 'iloveanimals123', '1');
INSERT INTO peeps (content, timestamp, name, username, user_id) VALUES ('Just call me the man with a fan! LOL', '2022-08-13 13:00:00', 'Zeus', 'habanerohotstuff', '2');