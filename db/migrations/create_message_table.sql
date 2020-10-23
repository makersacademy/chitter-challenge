CREATE TABLE message
(
  id SERIAL PRIMARY KEY
,
  tweet VARCHAR(60)
,
  created_at VARCHAR(30)
,
  username VARCHAR(20) REFERENCES "user"(username)
);