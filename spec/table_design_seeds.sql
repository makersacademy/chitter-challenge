CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  name text,
  username text,
  email_address text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  title text,
  content text,
  date_posted timestamp,
  maker_id int,
  constraint fk_maker foreign key (maker_id)
    references makers(id)
    on delete cascade
);