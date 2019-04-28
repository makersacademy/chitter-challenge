CREATE TABLE peep_table (
  id SERIAL PRIMARY KEY,
  peep VARCHAR(240) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT NOW()
);


CREATE TABLE Users (
  id SERIAL PRIMARY KEY,
  firstname VARCHAR(60) NOT NULL,
  lastname VARCHAR(60) NOT NULL,
  email VARCHAR(240) NOT NULL UNIQUE,
  password VARCHAR(180) NOT NULL UNIQUE,
  signed_up_on TIMESTAMP NOT NULL DEFAULT NOW()
);

INSERT INTO Users (firstname, lastname, email, password)
VALUES ('chris', 'brown', 'c@demo.com', 'password') 
RETURNING 'id';

INSERT INTO Users (firstname, lastname, email, password)
VALUES ('sam', 'brown', 's@demo.com', 'passwors') 
RETURNING 'id';