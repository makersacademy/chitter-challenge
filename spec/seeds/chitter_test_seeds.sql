TRUNCATE TABLE users, peeps RESTART IDENTITY;

INSERT INTO users (email, password_hash, name, username)
VALUES (
    'ohlookitdatboi@thisemail.com',
    'password',
    'Dat Boi',
    'datboi'
);

INSERT INTO users (email, password_hash, name, username)
VALUES (
    'mr_robinson@thisemail.com',
    'somepassword',
    'Rob Robinson',
    'robrobinson'
);

INSERT INTO peeps (time_posted, content, user_id)
VALUES (
    '2023-01-01 12:00:00',
    'Hello, world!',
    1
);

INSERT INTO peeps (time_posted, content, user_id)
VALUES (
    '2023-01-01 18:22:05',
    'I am a peep!',
    1
);