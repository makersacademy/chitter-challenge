-- -- peeps table
CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(100));
-- added timestamp column
ALTER TABLE peeps ADD COLUMN created_at TIMESTAMPTZ;
-- add user id to peeps
ALTER TABLE peeps ADD COLUMN user_id INTEGER REFERENCES chitter_users (id);
-- -- comments table
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), peep_id INTEGER REFERENCES peeps (id));
-- -- users table
CREATE TABLE chitter_users(id SERIAL PRIMARY KEY, email VARCHAR(60), password VARCHAR(140));
-- added username column
ALTER TABLE chitter_users ADD COLUMN username VARCHAR(60);
-- add tags table
CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(60));
-- add peeps tags table
CREATE TABLE peeps_tags(tag_id INTEGER REFERENCES tags (id), peep_id INTEGER REFERENCES peeps (id));