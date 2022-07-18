TRUNCATE TABLE peeps RESTART IDENTITY CASCADE;
TRUNCATE TABLE users RESTART IDENTITY CASCADE;

  WITH new_user AS (
    INSERT INTO users (first_name, last_name, email, username, password)
    VALUES (
    'Sara',
    'Smith',
    'test@example.com',
    'SaraSmith1',
    crypt('password', gen_salt('bf', 8))
  )
    RETURNING user_id
  )
  INSERT INTO peeps (content, user_id)
    SELECT 'my first peep!!', user_id
    FROM new_user;

  WITH new_user AS (
    INSERT INTO users (first_name, last_name, email, username, password)
    VALUES (
    'John',
    'Parker',
    'test2@example.com',
    'J0hnParker',
    crypt('password2', gen_salt('bf', 8))
  )
    RETURNING user_id
  )
  INSERT INTO peeps (content, user_id)
    SELECT 'what a great concept for an app', user_id
    FROM new_user;

  WITH new_user AS (
    INSERT INTO users (first_name, last_name, email, username, password)
    VALUES (
    'Troy',
    'Ng',
    'test3@example.com',
    'tAsInTroy',
    crypt('password3', gen_salt('bf', 8))
  )
    RETURNING user_id
  )
  INSERT INTO peeps (content, user_id)
    SELECT 'peeping everyday!', user_id
    FROM new_user;

  WITH new_user AS (
    INSERT INTO users (first_name, last_name, email, username, password)
    VALUES (
    'Bethany',
    'Roy',
    'test4@example.com',
    'Bethxx',
    crypt('password4', gen_salt('bf', 8))
  )
    RETURNING user_id
  ),
  new_peep AS (
    INSERT INTO peeps (content, user_id)
    SELECT 'chitter reminds me of something...', user_id
    FROM new_user
  )
  INSERT INTO peeps (content, user_id)
    SELECT 'love to peep', user_id
    FROM new_user;

  