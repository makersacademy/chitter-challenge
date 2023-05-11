DROP TABLE IF EXISTS posts; 

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  message text,
  time TIMESTAMP,
  user_account_id int,
  constraint fk_user_account foreign key(user_account_id)
    references user_account(id)
    on delete cascade
);


TRUNCATE TABLE posts RESTART IDENTITY;

INSERT INTO posts ("message", "time", "user_account_id") VALUES
('Fiona just shouted at me for not cleaning the outhouse', '2008-11-11 13:23:44', 1);