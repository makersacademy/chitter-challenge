TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users (name, email, password, username) VALUES ('First Name', 'firstname@email.com', '$2a$12$3szom8F8U2FzRLw/9Hbtre/q7lE7T8a3PNy/yoEKVIfpMRW6DRUgm', 'firstname');
INSERT INTO users (name, email, password, username) VALUES ('Second Name', 'secondname@email.com', '$2a$12$qPKjx6RUqlBW1DReRvxLCeJobvx7oP2nk6HP7Xdb7ATD74BqeRPKy', 'secondname');

INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username firstname', '2022-01-08 04:05:06', 1);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username firstname', '2022-01-09 18:00:05', 1);
INSERT INTO posts (content, time, user_id) VALUES ('This is an example post from username secondname', '2022-01-08 05:02:03', 2);
INSERT INTO posts (content, time, user_id) VALUES ('This is another example post from username secondname', '2022-01-09 20:0:06', 2);