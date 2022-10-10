TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (username, email_address, password) VALUES ('ollie', 'ollie@gmail.com', 'owl');
INSERT INTO users (username, email_address, password) VALUES ('charlie', 'charlie@gmail.com', 'bear');
INSERT INTO users (username, email_address, password) VALUES ('alex', 'alex@gmail.com', 'rabbit');


INSERT INTO peeps (content, time, user_id) VALUES ('I love games', '2022-05-27 13:00:01', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('I love golf', '2022-05-28 14:10:11', 1);
INSERT INTO peeps (content, time, user_id) VALUES ('I love football', '2021-10-14 15:20:31', 2);
INSERT INTO peeps (content, time, user_id) VALUES ('I love cars', '2020-08-12 08:09:50', 3);