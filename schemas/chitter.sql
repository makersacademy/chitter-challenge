CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE IF NOT EXISTS users (
  user_id uuid DEFAULT uuid_generate_v4 (),
  first_name text NOT NULL,
  last_name text NOT NULL, 
  email citext NOT NULL UNIQUE,
  username varchar (32) NOT NULL UNIQUE,
  password text NOT NULL,
  PRIMARY KEY (user_id)
);

CREATE TABLE IF NOT EXISTS peeps (
  peep_id uuid DEFAULT uuid_generate_v4 (),
  content varchar (512) NOT NULL,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
  user_id uuid,
  PRIMARY KEY (peep_id),
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id)
      ON DELETE SET NULL
);
