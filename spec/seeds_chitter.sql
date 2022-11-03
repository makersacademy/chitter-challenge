TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (username, password, email) VALUES ('sia', 'musicl0v3r', 'sia@fake.com');
INSERT INTO users (username, password, email) VALUES ('batman', 'justicel0v3r', 'batman@fake.com');
INSERT INTO users (username, password, email) VALUES ('captain_hook', 'shipl0v3r', 'hook@fake.com');

INSERT INTO posts (content, date, time, user_id) VALUES ('I love music! x', '2022-10-31', '05:05', 1);
INSERT INTO posts (content, date, time, user_id) VALUES ('Fighting crime is more important than music! x', '2022-10-31', '07:15', 2);
INSERT INTO posts (content, date, time, user_id) VALUES ('arrrr hide me from batman x', '2022-10-31', '10:20', 3);
INSERT INTO posts (content, date, time, user_id) VALUES ('ready for my new album? x', '2022-11-01', '11:25', 1);
INSERT INTO posts (content, date, time, user_id) VALUES ('ignore my post from yesterday. need tunes for batmobile. x', '2022-11-01', '12:30', 2);