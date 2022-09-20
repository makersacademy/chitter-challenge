CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  date_time timestamp,
  user_f_name text,
  user_handle text
);

CREATE TABLE users (
  id SERIAL UNIQUE NOT NULL,
  email text UNIQUE NOT NULL,
  password text,
  f_name text,
  handle text UNIQUE NOT NULL,
  PRIMARY KEY (id, email, handle)
);

CREATE TABLE peeps_users (
  peep_id int,
  user_id int,
  constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
  constraint fk_user foreign key(user_id) references users(id) on delete cascade,
  PRIMARY KEY (peep_id, user_id)
);