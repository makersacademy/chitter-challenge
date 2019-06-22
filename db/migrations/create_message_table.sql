CREATE TABLE message(id SERIAL PRIMARY KEY
, message VARCHAR(60)
, created_at VARCHAR(20)
, username VARCHAR(20) REFERENCES "user"(username));
