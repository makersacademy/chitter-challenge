DROP TABLE IF EXISTS makers, peeps;

CREATE TABLE makers (
  id SERIAL PRIMARY KEY,
  email citext not null UNIQUE,
  password varchar(32) not null,
  name text not null,
  username varchar(15) not null UNIQUE
);

CREATE TABLE peeps (
  id SERIAL PRIMARY KEY,
  content text,
  time timestamp without time zone,
  maker_id int,
  constraint fk_maker foreign key(maker_id)
    references makers(id)
    on delete cascade
);



