DROP TABLE IF EXISTS posts;

CREATE TABLE posts (id SERIAL PRIMARY KEY, post_date DATE, title TEXT, content TEXT, user_id int4, CONSTRAINT fk_user FOREIGN KEY(user_id) REFERENCES users(id));

TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO posts (post_date, title, content, user_id) VALUES ('2011-11-11', 'test_title_1', 'test_content_1', 1), ('2012-10-11', 'test_title_2', 'test_content_2', 1),
('2013-10-11', 'test_title_3', 'test_content_3', 1),('2012-10-11', 'test_title_4', 'test_content_4', 2);
