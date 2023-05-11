-- file: peeps_users.sql

DROP TABLE peeps_users;
DROP TABLE peeps;
DROP TABLE users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  username text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  user_id int,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade
);


-- Create the join table.
CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peeps foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_users foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);