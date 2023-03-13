CREATE TABLE peepers (
  id SERIAL PRIMARY KEY,
  username text,
  password text
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  message text,
  time_of_peep time,
  peeper_id int,
  constraint fk_peeper foreign key(peeper_id)
    references peepers(id)
    on delete cascade
);