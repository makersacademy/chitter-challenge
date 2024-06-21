# in migrations/chitter-user_table.sql
CREATE TABLE user_chitter(
   id SERIAL PRIMARY KEY,
   first_name VARCHAR(50) NOT NULL,
   last_name VARCHAR(50) NOT NULL,
   user_email VARCHAR (60) UNIQUE,
   user_password VARCHAR(140),
   user_name VARCHAR(50)
);
