TRUNCATE TABLE users, peeps RESTART IDENTITY; 

INSERT INTO users (name, username, email, password ) VALUES ('David', 'davidjs', 'david@makers.com', 'password1');
INSERT INTO users (name, username, email, password ) VALUES ('Anna', 'annang', 'anna@makers.com', 'password2');

INSERT INTO peeps(content, time, user_id) VALUES ('Do the solo chitter project', '2023-01-08 10:05:06', '1');
INSERT INTO peeps(content, time, user_id) VALUES ('Do the shop mamnager project', '2023-02-10 10:15:06', '2');