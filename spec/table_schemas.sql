CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  email text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);
