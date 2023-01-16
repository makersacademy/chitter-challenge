TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password_hash, name, username)
    VALUES (
        'MrGood92@email.com', 
        '$2a$12$KUwI9IGRXES5Z8oybhNJPuriDGx8XM0UtU8Hj7NJGdu1NUF4y50/2',
        'John Good',
        'MrGood92');

INSERT INTO users (email, password_hash, name, username)
    VALUES (
        'DrEvil59@email.com', 
        '$2a$12$l2Z/CDu2u5fXQbnTb3QyjuU65JvDblyauIbbLljFVFNMosMQyeS4e',
        'Karen Evil',
        'DrEvil59');

INSERT INTO peeps (time_posted, content, user_id)
    VALUES (
        '2023-01-13 14:22:06', 
        'First peep on this chit!!!',
        1);

INSERT INTO peeps (time_posted, content, user_id)
    VALUES (
        '2023-01-13 15:05:23', 
        'Going surfing tomoz, who wants to join, hit me up!',
        1);     