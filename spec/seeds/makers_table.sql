CREATE TABLE IF NOT EXISTS makers (
  id SERIAL PRIMARY KEY,
  email citext not null UNIQUE,
  password varchar(32) not null,
  name text not null,
  username varchar(15) not null UNIQUE
);

TRUNCATE TABLE makers RESTART IDENTITY;

INSERT INTO makers ("email", "password", "name", "username") VALUES 
('maker1@mail.com', '12345678', 'maker1', 'username1'),
('maker2@mail.com', '12345678', 'maker2', 'username2');

