DROP TABLE IF EXISTS tweets;

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

