CREATE TABLE peeps(
ID serial PRIMARY KEY,
message VARCHAR (250) NOT NULL,
username_id VARCHAR (50),
FOREIGN KEY (username_id) REFERENCES users (username)
);
