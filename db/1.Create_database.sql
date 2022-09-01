CREATE TABLE chitts (
	post_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
  chitt VARCHAR ( 255 ) NOT NULL,
	created_on TIMESTAMP NOT NULL
);
CREATE TABLE accounts (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
  name VARCHAR ( 50 ) NOT NULL,
	created_on TIMESTAMP NOT NULL,
        last_login TIMESTAMP 
);