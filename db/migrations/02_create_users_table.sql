CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  email VARCHAR ( 40 ),
  name VARCHAR,
  username VARCHAR ( 14 ),
  password VARCHAR ( 15 ));
