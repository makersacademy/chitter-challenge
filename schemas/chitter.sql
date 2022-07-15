CREATE EXTENSION IF NOT EXISTS citext;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION pgcrypto;

CREATE TABLE IF NOT EXISTS users (
  user_id uuid DEFAULT uuid_generate_v4 (),
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

CREATE TABLE IF NOT EXISTS comments (
  comment_id uuid DEFAULT uuid_generate_v4 (),
  content varchar (512) NOT NULL,
  created TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
  updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0) NOT NULL,
  user_id uuid,
  peep_id uuid,
  PRIMARY KEY (comment_id),
  CONSTRAINT fk_user
    FOREIGN KEY(user_id)
      REFERENCES users(user_id)
      ON DELETE SET NULL,
  CONSTRAINT fk_peep 
    FOREIGN KEY(peep_id)
      REFERENCES peeps(peep_id)
      ON DELETE SET NULL
);