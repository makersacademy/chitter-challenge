DROP TABLE IF EXISTS user_accounts, posts; 

CREATE TABLE user_accounts (
  id SERIAL PRIMARY KEY,
  email_address text,
  username text,
  name text,
  password text
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time TIMESTAMP,
  user_account_id int,
  constraint fk_user_account foreign key(user_account_id)
    references user_accounts(id)
    on delete cascade
);


TRUNCATE TABLE user_accounts, posts RESTART IDENTITY;

INSERT INTO user_accounts ("email_address", "username", "name", "password") VALUES
('shrek@swamp.com', 'fionalover420', 'Shrek', 'I_Love_Fiona_69');

INSERT INTO posts ("message", "time", "user_account_id") VALUES
('Fiona just shouted at me for not cleaning the outhouse', '2008-11-11 13:23:44', 1);