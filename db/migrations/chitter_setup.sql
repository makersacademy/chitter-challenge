CREATE TABLE chitter_users(user_id SERIAL PRIMARY KEY, email VARCHAR(50), name VARCHAR(20), handle VARCHAR(20), password VARCHAR(20));
CREATE TABLE chitter_peeps(peep_id SERIAL PRIMARY KEY, content VARCHAR(140), time_stamp TIMESTAMP, user_id INT REFERENCES chitter_users(user_id));

INSERT INTO chitter_users(user_id, email, name, handle, password) VALUES('1','william@gmail.com','bill','billy123','bad_pw');
INSERT INTO chitter_users(user_id, email, name, handle, password) VALUES('2','jessica@gmail.com','jess','knock_knock','vbad_pw');

INSERT INTO chitter_peeps(peep_id, content, time_stamp, user_id) VALUES('1','hi @billy123','2021-04-25 20:26:10','2');
INSERT INTO chitter_peeps(peep_id, content, time_stamp, user_id) VALUES('2','hi @knock_knock','2021-04-25 20:27:00','1');
INSERT INTO chitter_peeps(peep_id, content, time_stamp, user_id) VALUES('3','who''s there?','2021-04-25 20:32:24','2');
INSERT INTO chitter_peeps(peep_id, content, time_stamp, user_id) VALUES('4','..uh...','2021-04-25 20:42:44','1');
