CREATE TABLE peeps(id serial PRIMARY KEY, content VARCHAR(280) NOT NULL,
created_at TIMESTAMP NOT NULL);

INSERT INTO peeps(content, created_at)
VALUES('Hello World!', NOW()),('This breakfast is amazing!', NOW()),('Shout out to my fam', NOW()),('Just read the most interesting article', NOW());
