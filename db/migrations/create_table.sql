CREATE TABLE peeps(
  id SERIAL PRIMARY KEY,
  peep VARCHAR(140),
  user_email VARCHAR(30),
  time VARCHAR(30)
  );

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR(60),
  password VARCHAR(140)
  );
