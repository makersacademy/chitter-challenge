TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password_hash, name, username)
    VALUES (
        'MrGood92@email.com', 
        '$2a$12$tJPQyZwySIaC33URmeezaeVu3Rt.sFJFdkM2PC4cDfD8WWRxl9.Me',
        'John Good',
        'MrGood92');

INSERT INTO users (email, password_hash, name, username)
    VALUES (
        'DrEvil59@email.com', 
        '$2a$12$AnpyVfD8i5crd/1Ie.X3mOShzEntBnJfqaMaDHJRstGC58jOgBr9G',
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