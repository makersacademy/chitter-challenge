\c chitter
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), post_id INT, user_id INT, created_at TIMESTAMP);

\c chitter_test
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), post_id INT, user_id INT, created_at TIMESTAMP);
