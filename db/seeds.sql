TRUNCATE TABLE users, posts RESTART IDENTITY;

INSERT INTO users (email, password_hash, name, username)
VALUES ('alice@makersacademy.com', '$2a$12$5/u2wF0CJwS4FvE5fF7lXeJnTlylSmfEQUmxAjgJ5F62n8GqBUxUq', 'Alice',
        'aliceinwonderland'),
       ('bob@makersacademy.com', '$2a$12$wWYnwD0ji3Xr7PFAkY7zxOAfoHCMU9MPc./bLvZCjBvES3TlI6tgW', 'Bob',
        'bobthebuilder'),
       ('carol@makersacademy.com', '$2a$12$grGbWj5HFH9lk7PmQtbMYeyZyfnJQ9t7f8dNqGSL3zeKlZiRrVXSW', 'Carol',
        'carolsinging');
-- password1, password2, password3

INSERT INTO posts (content, timestamp, user_id)
VALUES ('My first post', '2023-01-31 10:10:10', 1),
       ('Just joined', '2023-02-01 14:40:55', 2),
       ('Hi Bob', '2023-02-01 14:45:20', 1),
       ('Hello you two', '2023-02-02 08:32:01', 3);