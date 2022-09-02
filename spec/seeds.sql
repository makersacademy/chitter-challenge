TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (name, username, email, password) VALUES ('Moe', 'moeez', 'moeez@gmail.com', 'strong123');
INSERT INTO users (name, username, email, password) VALUES ('Joe', 'joeez', 'joeez@gmail.com', 'weak123');
INSERT INTO users (name, username, email, password) VALUES ('Foe', 'foeez', 'foeez@gmail.com', 'wicked123');


INSERT INTO posts (message, timestamp, user_id) VALUES ('Any man who must say, "I am the king," is no true king.', '2022-08-01 12:00:00', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('If you think this has a happy ending, you havent been paying attention.', '2022-07-04 12:00:00', 2);
INSERT INTO posts (message, timestamp, user_id) VALUES ('The man who passes the sentence should swing the sword.','2022-06-04 12:00:00', 3);


