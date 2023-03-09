TRUNCATE TABLE users RESTART IDENTITY; 

INSERT INTO users (fullname, username, email, password_digest) VALUES ('Chang Huynh', 'changwynn', 'huynchang@gmail.com', 'passworD+123');
INSERT INTO users (fullname, username, email, password_digest) VALUES ('John Doe', 'jdoe', 'johndoe@hotmail.com', 'Password.456');
INSERT INTO users (fullname, username, email, password_digest) VALUES ('Mike Bike', 'mrbike', 'mike.bike@hotmail.com', 'paSSword$789');