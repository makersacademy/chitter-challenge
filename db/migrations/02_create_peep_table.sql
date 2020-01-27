CREATE TABLE peeps (
  id serial,
  userid INTEGER,
  peep varchar(250) NOT NULL,
  created_at TIMESTAMPTZ NOT NULL,
  FOREIGN KEY (userid) REFERENCES users(id)
);