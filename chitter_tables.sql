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
  message text NOT NULL,
  timestamp timestamp,
  user_id int NOT NULL,
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