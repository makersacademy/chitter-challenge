TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password, name, username)
    VALUES (
        'MrGood92@email.com', 
        '$2a$12$tJPQyZwySIaC33URmeezaeVu3Rt.sFJFdkM2PC4cDfD8WWRxl9.Me',
        'John Good',
        'MrGood92');

INSERT INTO users (email, password, name, username)
    VALUES (
        'DrEvil59@email.com', 
        '$2a$12$AnpyVfD8i5crd/1Ie.X3mOShzEntBnJfqaMaDHJRstGC58jOgBr9G',
        'Karen Evil',
        'DrEvil59');