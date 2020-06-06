CREATE DATABASE chitter
\c chitter
CREATE TABLE peeps (id SERIAL PRIMARY KEY, text TEXT, time TIMESTAMP, username VARCHAR(20));
INSERT INTO peeps (text, time, username) VALUES ('peep1', '2020-06-06 11:10:25', 'someone'),
 ('peep2', '2020-06-06 11:15:25', 'someone');
