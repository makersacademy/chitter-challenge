CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(280));
ALTER TABLE peeps ADD COLUMN time_stamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;