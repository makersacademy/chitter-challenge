CREATE DATABASE chitter
\c chitter
CREATE TABLE peeps (id SERIAL PRIMARY KEY, text TEXT, time TIMESTAMP);
INSERT INTO peeps (text, time) VALUES ('peep1', '2020-06-06 11:10:25'),
 ('peep2', '2020-06-06 11:15:25');
