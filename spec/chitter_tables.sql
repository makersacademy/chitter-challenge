CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  timestamp,
  user_id int
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username text,
  email text,
  password
);

-- CREATE TABLE peeps_tags (
--   peeps_id int,
--   user_id int,
--   constraint fk_peep foreign key(peep_id) references peeps(id) on delete cascade,
--   constraint fk_user foreign key(user_id) references users(id) on delete cascade,
--   PRIMARY KEY (peep_id, user_id) 
-- );