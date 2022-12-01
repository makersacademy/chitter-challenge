TRUNCATE TABLE users, peeps, comments RESTART IDENTITY;

INSERT INTO users (email_address, password, name, username) VALUES ('sarahjacobs@gmail.com', 'StrongPassword123!!', 'Sarah Jacobs', 'JazzySaz');
INSERT INTO users (email_address, password, name, username) VALUES ('johnny22@gmail.com', '22pwordjj', 'Johnny James', 'JJ22');
INSERT INTO users (email_address, password, name, username) VALUES ('lewisjandrews@outlook.com', 'Norfolk?91', 'Lewis Andrews', 'Luigi_100');


INSERT INTO peeps (content, date_and_time, user_id) VALUES ('My first peep!!!', '2022-11-30 12:05:06', 1);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Second Maker to peep lmao!', '2022-11-30 16:45:12', 2);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Bronze medal for me lololol', '2022-12-01 11:22:34', 3);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Go Makers!!', '2022-12-01 17:01:02', 1);
INSERT INTO peeps (content, date_and_time, user_id) VALUES ('Has anyone seen my rubber duck?', '2022-12-01 18:11:55', 2);

INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('You beat me to it!!', '2022-11-30 17:05:11', 2, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('Do I win a prize?', '2022-11-30 17:10:20', 1, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('In your dreams lol', '2022-11-30 17:21:40', 2, 1);
INSERT INTO comments (content, date_and_time, user_id, peep_id) VALUES ('Did you leave it in the bath again??', '2022-12-01 19:34:54', 3, 5);