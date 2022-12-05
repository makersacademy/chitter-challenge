TRUNCATE TABLE users, posts RESTART IDENTITY;
INSERT INTO users (name, username, email_address, password) VALUES ('Mike Oliver', 'mike', 'remoteunderscore@gmail.com', '321password');
INSERT INTO users (name, username, email_address, password) VALUES ('Steve Smith', 'steve', 'steve@steve.com', 'passwordddd');
INSERT INTO users (name, username, email_address, password) VALUES ('Amy Allen', 'amy', 'amy@amy.com', 'pppppppassssword');
INSERT INTO posts (message, message_time, user_id) VALUES ('Deployed', '2022-12-02 14:20:00', '1');
INSERT INTO posts (message, message_time, user_id) VALUES ('Deploying', '2022-12-02 13:20:00', '2');
INSERT INTO posts (message, message_time, user_id) VALUES ('Deployer', '2022-12-02 12:20:00', '3');
