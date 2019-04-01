/* this SQL creates a users table that will store a table of users 
with an id and name (limited to 30 characters) */


/* 
This is the syntax to add to the table.... 
INSERT INTO users VALUES(1, 'Bob');
*/

CREATE TABLE users
  ( 
  id SERIAL PRIMARY KEY,
  name VARCHAR(30)
  );
