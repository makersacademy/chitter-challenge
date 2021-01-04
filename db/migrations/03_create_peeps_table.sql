CREATE TABLE peeps(id SERIAL PRIMARY KEY, fullname VARCHAR(60), username VARCHAR(60), content VARCHAR(240), created_at timestamp(0) NOT NULL DEFAULT now());
