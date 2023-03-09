TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

INSERT INTO users (fullname, username, email, password) VALUES ('Chang Huynh', 'changwynn', 'huynchang@gmail.com', 'passworD+123');
INSERT INTO users (fullname, username, email, password) VALUES ('John Doe', 'jdoe', 'johndoe@hotmail.com', 'Password.456');
INSERT INTO users (fullname, username, email, password) VALUES ('Mike Bike', 'mrbike', 'mike.bike@hotmail.com', 'paSSword$789');