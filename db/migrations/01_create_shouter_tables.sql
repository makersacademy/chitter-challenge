CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(100), email VARCHAR(100), password VARCHAR(100));
CREATE TABLE shouts(shout_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users, time_shouted VARCHAR(60), shout_content VARCHAR(100));
INSERT INTO users (name, username, email, password) VALUES('Han Solo', 'Solo', 'han@mfalcon.com', 'C4rb0n1te');
INSERT INTO shouts (user_id, time_shouted, shout_content) VALUES(1, '27 Mar, 21 | 22:20','Just blew up the Death Star');
INSERT INTO shouts (user_id, time_shouted, shout_content) VALUES(1, '27 Mar, 21 | 22:25','I shot first');

-- CREATE TABLE comments(comment_ID SERIAL PRIMARY KEY, comment VARCHAR(240), bookmark_ID integer REFERENCES bookmarks);
-- CREATE TABLE tags(tagID SERIAL PRIMARY KEY, tag VARCHAR(60));
-- CREATE TABLE bookmark_tags(bookmark_tagID SERIAL PRIMARY KEY, bookmarkID INTEGER REFERENCES bookmarks, tagID INTEGER REFERENCES tags);
