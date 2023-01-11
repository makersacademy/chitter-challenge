CREATE EXTENSION pgcrypto;

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content TEXT,
  date_time timestamp,
  user_id INT
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL UNIQUE,
  email TEXT NOT NULL UNIQUE,
  password TEXT NOT NULL
);

-- CREATE TABLE peeps_tags (
--   peeps_id int,
--   user_id int,
--   constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
--   constraint fk_user foreign key(user_id) references users(id) on delete cascade,
--   PRIMARY KEY (peep_id, user_id) 
-- );