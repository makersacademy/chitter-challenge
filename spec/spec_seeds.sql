TRUNCATE TABLE peeps, users RESTART IDENTITY;

INSERT INTO users (username, password) VALUES ('Edward', '12345');
INSERT INTO users (username, password) VALUES ('James', 'Maths!');
INSERT INTO users (username, password) VALUES ('Luke', 'javascript10');
INSERT INTO users (username, password) VALUES ('Max', 'qwertyuiop');

INSERT INTO peeps (message, time, date, user_id) VALUES ('I am the first post on peeps!', '09:12:00', '2023-02-01', 1);
INSERT INTO peeps (message, time, date, user_id) VALUES ('I am also the second post', '09:18:00', '2023-02-01', 1);
INSERT INTO peeps (message, time, date, user_id) VALUES ('Hello world!', '10:25:00', '2023-02-01', 3);
INSERT INTO peeps (message, time, date, user_id) VALUES ('Greetings Chitter', '10:43:00', '2023-02-01', 2);
INSERT INTO peeps (message, time, date, user_id) VALUES ('This is my favourite app already', '11:59:00', '2023-02-01', 4);