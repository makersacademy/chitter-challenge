CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  username VARCHAR(20) UNIQUE,
  name VARCHAR(40),
  email VARCHAR(40) UNIQUE,
  password VARCHAR(60)
);

INSERT INTO users (username, name, email, password) VALUES('@alittlecross','Paul','alittlecross@live.co.uk','1234');
INSERT INTO users (username, name, email, password) VALUES('@danusia.x','Dana','miroslawa@gmail.com','1234');
INSERT INTO users (username, name, email, password) VALUES('@thomas','Tom','tom.seacroft@rpa.gov.uk','1234');
INSERT INTO users (username, name, email, password) VALUES('@willow','Will','wilberforce@grindr.com','1234');
INSERT INTO users (username, name, email, password) VALUES('@alicewolf','Alice','alice.lieutier@makers.co.uk','1234');
