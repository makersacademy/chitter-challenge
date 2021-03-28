CREATE TABLE users(user_id SERIAL PRIMARY KEY, name VARCHAR(100), username VARCHAR(100), email VARCHAR(100), password VARCHAR(100));
CREATE TABLE shouts(shout_id SERIAL PRIMARY KEY, user_id INTEGER REFERENCES users, time_shouted VARCHAR(60), shout_content VARCHAR(100));
CREATE TABLE replies(reply_id SERIAL PRIMARY KEY,shout_id INTEGER REFERENCES shouts, user_id INTEGER REFERENCES users, time_replied VARCHAR(60), reply_content VARCHAR(100));
INSERT INTO users (name, username, email, password) VALUES('Han Solo', 'Solo', 'han@mfalcon.com', '$2a$12$DXl8ehH9k2brLxQJruQ0.uUThLIWtKUZoOg1YgYCa9enzNkr3fa8W');
INSERT INTO users (user_id, name, username, email, password) VALUES('99','anonymous', 'anon', '', '$2a$12$SjvJoIZgeEMTnV3rJge58ubUwsDSL0U270Yi2n4UF78D92b3nQC2u');
INSERT INTO shouts (user_id, time_shouted, shout_content) VALUES(1, '27 Mar, 21 | 22:20','Just blew up the Death Star');
INSERT INTO shouts (user_id, time_shouted, shout_content) VALUES(1, '27 Mar, 21 | 22:25','I shot first');

-- CREATE TABLE comments(comment_ID SERIAL PRIMARY KEY, comment VARCHAR(240), bookmark_ID integer REFERENCES bookmarks);
-- CREATE TABLE tags(tagID SERIAL PRIMARY KEY, tag VARCHAR(60));
-- CREATE TABLE bookmark_tags(bookmark_tagID SERIAL PRIMARY KEY, bookmarkID INTEGER REFERENCES bookmarks, tagID INTEGER REFERENCES tags);
