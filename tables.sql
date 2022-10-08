

CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email varchar(319),
  password text,
  loggedin text DEFAULT 'false'
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,   
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);