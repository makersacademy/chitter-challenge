TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (username, password, email) VALUES ('Edward', '12345', 'edward@makers.com');
INSERT INTO users (username, password, email) VALUES ('James', 'Maths!', 'james@makers.com');
INSERT INTO users (username, password, email) VALUES ('Luke', 'javascript10', 'luke@makers.com');
INSERT INTO users (username, password, email) VALUES ('Max', 'qwertyuiop', 'max@makers.com');

INSERT INTO peeps (message, time, date, user_id) VALUES ('I am the first post on peeps!', '09:12:00', '2023-02-01', 1);
INSERT INTO peeps (message, time, date, user_id) VALUES ('I am also the second post', '09:18:00', '2023-02-01', 1);
INSERT INTO peeps (message, time, date, user_id) VALUES ('Hello world!', '10:25:00', '2023-02-01', 3);
INSERT INTO peeps (message, time, date, user_id) VALUES ('Greetings Chitter', '10:43:00', '2023-02-01', 2);
INSERT INTO peeps (message, time, date, user_id) VALUES ('This is my favourite app already', '11:59:00', '2023-02-01', 4);