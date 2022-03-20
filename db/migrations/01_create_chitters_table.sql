CREATE TABLE chitter_posts(id SERIAL PRIMARY KEY, post VARCHAR(280));
ALTER TABLE chitter_posts ADD time VARCHAR(30);
