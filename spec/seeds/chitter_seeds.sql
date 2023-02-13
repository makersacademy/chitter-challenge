
TRUNCATE TABLE users, peeps RESTART IDENTITY;


INSERT INTO users (name, email, username, password) VALUES ('Janet Blane', 'janet11@gmail.com', 'janet11', 'password');
INSERT INTO users (name, email, username, password) VALUES ('Marcus Jones', 'marcusj123@gmail.com', 'marcus123', 'password123');
INSERT INTO users (name, email, username, password) VALUES ('Ray Holt', 'raymondholt@gmail.com', 'ray_holt', 'cheddar007');

INSERT INTO peeps (contents, time, user_id) VALUES ('hello peeps', '2023-01-08 04:05:06', 1);
INSERT INTO peeps (contents, time, user_id) VALUES ('I love dogs', '2021-09-25 13:20:05', 2);
INSERT INTO peeps (contents, time, user_id) VALUES ('coding is fun!', '2020-03-23 22:15:45', 3);
INSERT INTO peeps (contents, time, user_id) VALUES ('went fishing!', '2023-02-11 20:03:34', 1);

