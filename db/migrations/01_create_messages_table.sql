CREATE TABLE messages
(
  id SERIAL PRIMARY KEY,
  content VARCHAR(150),
  date_posted timestamp
);

INSERT INTO messages
  (content, date_posted)
VALUES('This is a message', NOW());
