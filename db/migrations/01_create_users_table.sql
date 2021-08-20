CREATE TABLE users(
  id INT GENERATED ALWAYS AS IDENTITY,
  handle VARCHAR(15) UNIQUE NOT NULL,
  name VARCHAR(40) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(30) NOT NULL,
  PRIMARY KEY(id)
);
