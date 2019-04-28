CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(60),
                       username VARCHAR(60) NOT NULL UNIQUE,
                       email VARCHAR(150) NOT NULL UNIQUE,
                       password VARCHAR(60) NOT NULL );
