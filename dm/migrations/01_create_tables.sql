DROP TABLE IF EXISTS tweets;
DROP TABLE IF EXISTS users;


CREATE TABLE users(
  username VARCHAR(255) NOT NULL UNIQUE,
  email VARCHAR(30) NOT NULL UNIQUE,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  password VARCHAR(100) NOT NULL,
  PRIMARY KEY(username)
  );

CREATE TABLE tweets(
    tweet_id INT GENERATED ALWAYS AS IDENTITY, 
    username VARCHAR(255) NOT NULL,
    message VARCHAR(140) NOT NULL,
    time timestamp without time zone default (now() at time zone 'utc'),
    PRIMARY KEY(tweet_id),
    CONSTRAINT fk_user
        FOREIGN KEY(username) 
        REFERENCES users(username)
  );

