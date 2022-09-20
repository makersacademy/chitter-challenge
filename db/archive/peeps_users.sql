CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_time timestamp,
  user_f_name text,
  user_handle text
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email text,
  password text,
  f_name text,
  handle text
);

CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);