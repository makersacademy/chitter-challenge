CREATE TABLE users (id SERIAL PRIMARY KEY,
   email VARCHAR(60) NOT NULL UNIQUE,
   password VARCHAR(140)NOT NULL,
   name VARCHAR(60),
   username VARCHAR(20) NOT NULL UNIQUE);
