TRUNCATE TABLE comments RESTART IDENTITY;
TRUNCATE TABLE peeps RESTART IDENTITY;
TRUNCATE TABLE users RESTART IDENTITY;

INSERT INTO users (
  email, 
  username, 
  password
) 
VALUES
  (
    'test@example.com',
    'TaylorSwift20',
    crypt('password', gen_salt('bf', 8)), 
  ),
  (
    'test2@example.com',
    'JustinBieber1',
    crypt('password', gen_salt('bf', 8)), 
  ),
  (
    'test3@example.com',
    'SelenaGomez50',
    crypt('password', gen_salt('bf', 8)), 
  ),
  (
    'test4@example.com',
    'NickJonas8',
    crypt('password', gen_salt('bf', 8)), 
  ),
  (
    'test5@example.com',
    'MileyCyrus5',
    crypt('password', gen_salt('bf', 8)), 
  );

INSERT INTO peeps (
  content,
  user_id 
)
VALUES  
  (
    'first peep',
    SELECT user_id FROM users WHERE email == 'test@example.com'
  ),
  (
    'second peep',
    SELECT user_id FROM users WHERE email == 'test2@example.com'
  ),
  (
    'third peep',
    SELECT user_id FROM users WHERE email == 'test3@example.com'
  );

INSERT INTO comments (
  content,
  user_id,
  peep_id
)
VALUES 
  (
    'comment',
    SELECT user_id FROM users WHERE email == 'test5@example.com',
    SELECT peep_id FROM peeps WHERE content == 'first peep'
  ),
  (
    'second comment',
    SELECT user_id FROM users WHERE email == 'test4@example.com',
    SELECT peep_id FROM peeps WHERE content == 'second peep'
  ),
  (
    'third comment',
    SELECT user_id FROM users WHERE email == 'test3@example.com',
    SELECT peep_id FROM peeps WHERE content == 'first peep'
  );
  
