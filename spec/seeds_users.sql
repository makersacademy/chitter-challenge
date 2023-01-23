TRUNCATE TABLE users, posts RESTART IDENTITY; 

INSERT INTO users (name, user_name, email, password) VALUES ('Harry Potter', 'lightning-boy', 'harry@hogwarts.com', 'scarhead1234');
INSERT INTO users (name, user_name, email, password) VALUES ('Ron Weasley', 'gingernut', 'ron@hogwarts.com', 'redhead4eva');
INSERT INTO users (name, user_name, email, password) VALUES ('Hermione Granger', 'clever-cloggs', 'herminone@hogwarts.com', 'best-in-class');
INSERT INTO posts (message, timestamp, user_id) VALUES ('Tom Riddle is a baddie', '2023-01-08 12:05:06', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('gingernut has dirt on his nose', '2023-01-07 15:11:06', 3);
INSERT INTO posts (message, timestamp, user_id) VALUES ('I heart Ginny', '2023-01-08 09:05:06', 1);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Looking forward to quidditch world cup!', '2023-01-09 11:11:06', 2);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Re-reading Hogwards: A History', '2023-01-07 16:24:06', 3);
INSERT INTO posts (message, timestamp, user_id) VALUES ('Do one, Malfoy', '2023-01-08 21:09:06', 1);