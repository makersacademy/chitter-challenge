TRUNCATE TABLE users, peeps, comments RESTART IDENTITY; 

 INSERT INTO users (username, email, password) VALUES ('willj836', 'willj836@gmail.com', 'abcd');
 INSERT INTO users (username, email, password) VALUES ('OptimusPrime', 'op123@hotmail.com', '123');
 INSERT INTO users (username, email, password) VALUES ('Jill', 'jill@yahoomail.com', 'password');
 INSERT INTO peeps (content, time_posted, user_id) VALUES ('My first post', '2022-11-30 11:53:23', 1);
 INSERT INTO peeps (content, time_posted, user_id) VALUES ('I am a transformer', '2022-11-30 15:23:45', 2);
 INSERT INTO peeps (content, time_posted, user_id) VALUES ('My second post', '2022-11-30 18:25:58', 1);
 INSERT INTO peeps (content, time_posted, user_id) VALUES ('Hello, I am Jill', '2022-11-30 18:37:29', 3);
 INSERT INTO peeps (content, time_posted, user_id) VALUES ('My third post', '2022-11-30 19:01:57', 1);
 INSERT INTO comments (content, time_posted, user_id, peep_id) VALUES ('wow amazing', '2022-11-30 17:21:24', 1, 2);
 INSERT INTO comments (content, time_posted, user_id, peep_id) VALUES ('My first reply', '2022-11-30 11:56:27', 1, 1);
 INSERT INTO comments (content, time_posted, user_id, peep_id) VALUES ('Hello Jill', '2022-11-30 18:45:07', 2, 4);

