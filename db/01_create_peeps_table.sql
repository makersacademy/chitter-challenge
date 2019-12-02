This file records the sql that was used to create the peeps table for both the Chitter database & the Chitter_test database

CREATE TABLE "peeps" (id SERIAL PRIMARY KEY, content VARCHAR(140), author_name VARCHAR(140), author_handle VARCHAR(140), ti
me time(0));

sql that was used to create the users table for both the Chitter database & the Chitter_test database

CREATE TABLE "users" (id SERIAL PRIMARY KEY, author_name VARCHAR(140), author_handle VARCHAR(140), email VARCHAR(140), pass
word VARCHAR(20));
