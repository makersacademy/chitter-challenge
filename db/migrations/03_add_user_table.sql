CREATE TABLE users
( id serial PRIMARY KEY,
 first_name VARCHAR(140),
 last_name VARCHAR(140),
 email VARCHAR(60) UNIQUE,
 password VARCHAR(140),
 user_name VARCHAR(60) UNIQUE);
