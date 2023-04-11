CREATE TABLE users (
	user_id serial PRIMARY KEY,
	name VARCHAR (50),
	username VARCHAR (50),
	email VARCHAR (75),
	password TEXT
);

CREATE TABLE peeps (
  peep_id serial PRIMARY KEY,
  created_on TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  content VARCHAR (120),
  author INT,
  constraint fk_user foreign key(author)
  references users(user_id)
  on delete cascade
);