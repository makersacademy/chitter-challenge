### Setting up databases ###

After creating two databases- 'chitter' and 'chitter_test'- in both you will need to set up two table:

CREATE TABLE users (
    id  INT4,
    first_name VARCHAR(60),
    username VARCHAR(60),
    email VARCHAR(60),
    password VARCHAR(60),
    last_name VARCHAR(60)
  );

CREATE TABLE peeps (
  id  INT4,
  username VARCHAR(60),
  peep TEXT,
  time TIMESTAMP
);
