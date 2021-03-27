CREATE TABLE shouts(shout_id SERIAL PRIMARY KEY, author VARCHAR(60), time_shouted VARCHAR(60), shout_content VARCHAR(100));
-- CREATE TABLE comments(comment_ID SERIAL PRIMARY KEY, comment VARCHAR(240), bookmark_ID integer REFERENCES bookmarks);
-- CREATE TABLE tags(tagID SERIAL PRIMARY KEY, tag VARCHAR(60));
-- CREATE TABLE bookmark_tags(bookmark_tagID SERIAL PRIMARY KEY, bookmarkID INTEGER REFERENCES bookmarks, tagID INTEGER REFERENCES tags);
