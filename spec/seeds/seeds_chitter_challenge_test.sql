--# table names: 'users'
TRUNCATE TABLE users RESTART IDENTITY CASCADE; 

--cannot truncate a table referenced in a foreign key constraint-- Solution is to as (CASCADE)

INSERT INTO users (email, password, username, name) VALUES ('chris_@hotmail.com', '1234567890abc', 'toppy', 'Chris Toplisek');
INSERT INTO users (email, password, username, name) VALUES ('rich_@gmail.com', '22222222abc', 'richy', 'Rich Toplieck');
INSERT INTO users (email, password, username, name) VALUES ('sunny_@gmail.com', '0987654321abc', 'sunny', 'Unknown');

-- table names: 'messages'
TRUNCATE TABLE messages RESTART IDENTITY; 

INSERT INTO messages (
    title, 
    content, 
    tags, 
    user_id
    ) 
VALUES (
    'paired programming', 
    'learning to pair program',
    '@mat',
    1
    );

INSERT INTO messages (
    title, 
    content, 
    tags, 
    user_id
    ) 
VALUES (
    'TDD learning', 
    'methods to writing a program',
    '@chris',
    2
    );

INSERT INTO messages (
    title, 
    content, 
    tags, 
    user_id
    ) 
VALUES (
    'OOP', 
    'learning object orintated programing',
    '@chris @sunny',
    1
    );