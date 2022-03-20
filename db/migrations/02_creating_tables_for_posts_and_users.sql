\c chitter
CREATE TABLE users(id SERIAL PRIMARY KEY, username  VARCHAR(60) UNIQUE, email VARCHAR(60) UNIQUE, first_name VARCHAR(60), last_name VARCHAR(60), password_digest VARCHAR(140));
CREATE TABLE posts(id SERIAL PRIMARY KEY, peep  VARCHAR(60), user_id INT);

\c chitter_test
CREATE TABLE users(id SERIAL PRIMARY KEY, username  VARCHAR(60) UNIQUE, email VARCHAR(60) UNIQUE, first_name VARCHAR(60), last_name VARCHAR(60), password_digest VARCHAR(140));
CREATE TABLE posts(id SERIAL PRIMARY KEY, peep  VARCHAR(60), user_id INT);
