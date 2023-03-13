CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text
  username text,
  email_address text
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  timestamp timestamp,
  content text,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);