CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(20),
  email VARCHAR(40),
  full_name VARCHAR(60),
  pwd VARCHAR(20)
);
INSERT INTO users (username, email, full_name, pwd) VALUES ('kiriarf', 'kiriarf@chitter.com', 'kiril', '123');
INSERT INTO users (username, email, full_name, pwd) VALUES ('leo', 'leo@chitter.com', 'Leo dog', '1234');
INSERT INTO users (username, email, full_name, pwd) VALUES ('felix', 'felix@chitter.com', 'Felix cat', '12345');
INSERT INTO users (username, email, full_name, pwd) VALUES ('durov', 'durov@telegram.com', 'Pavel Durov', '123456');
INSERT INTO users (username, email, full_name, pwd) VALUES ('trump', 'trump@us.gov', 'Donald', '1234567');
