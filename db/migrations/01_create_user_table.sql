CREATE TABLE user_table(id SERIAL PRIMARY KEY, name VARCHAR(60), password VARCHAR(50));
INSERT INTO user_table (name,password) VALUES ('tom','tom123');

CREATE TABLE peeps_table(id SERIAL PRIMARY KEY, peep VARCHAR(100));
INSERT INTO peeps_table (peep) VALUES ('My first peep');
