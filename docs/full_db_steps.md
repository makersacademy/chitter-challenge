Full and annoying complex set-up of the database
=================

Run psql:
```
CREATE DATABASE chitter;
CREATE DATABASE chitter_test;
```

Connect to the chitter database and build the tables:
```
\c chitter

CREATE TABLE users(
  id SERIAL,
  email VARCHAR,
  user_name VARCHAR,
  password VARCHAR
  );

CREATE TABLE peeps(
  id SERIAL,
  message VARCHAR(140),
  created_at TIMESTAMP,
  password INTEGER
  )
```


Connect to the chitter_test database and repeat:
```
\c chitter_test

CREATE TABLE users(
  id SERIAL,
  email VARCHAR,
  user_name VARCHAR,
  password VARCHAR
  );

CREATE TABLE peeps(
  id SERIAL,
  message VARCHAR(140),
  created_at TIMESTAMP,
  password INTEGER
  )
```

That should be it...
