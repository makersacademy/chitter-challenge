TRUNCATE TABLE users RESTART IDENTITY CASCADE;

INSERT INTO users
  (email, password, name, username)
  VALUES
    ('email_1', 'password_1', 'name_1', 'username_1'),
    ('email_2', 'password_2', 'name_2', 'username_2'),
    ('email_3', 'password_3', 'name_3', 'username_3'),
    ('email_4', 'password_4', 'name_4', 'username_4')
;