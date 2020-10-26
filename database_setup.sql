-- Run in chitter and chitter_test

CREATE TABLE users (
                    id SERIAL PRIMARY KEY, 
                    username varchar(50),
                    full_name varchar(50),
                    email varchar(50),
                    password varchar(200)
);
CREATE TABLE peeps (
                    id SERIAL PRIMARY KEY,
                    content varchar(500),
                    created_at timestamp,
                    poster_id integer   
);