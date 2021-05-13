CREATE DATABASE chitter;
CREATE TABLE tags (id SERIAL PRIMARY KEY, name VARCHAR);
CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR, username VARCHAR, picture VARCHAR, email VARCHAR, password VARCHAR);
CREATE TABLE peeps (id SERIAL PRIMARY KEY, FOREIGN KEY (user_id) REFERENCES users(id), user_id INT, "text" VARCHAR, date VARCHAR); 
CREATE TABLE peep_tags (id SERIAL PRIMARY KEY, FOREIGN KEY (peep_id) REFERENCES peeps(id), FOREIGN KEY (tag_id) REFERENCES tags(id), tag_id INT, peep_id INT); 
INSERT INTO users (id, name, username) VALUES(0, 'Anonymous', 'anon');