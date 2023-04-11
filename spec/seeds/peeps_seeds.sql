DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    time TIMESTAMP,
    content text,
    user_id int,
    constraint fk_user foreign key(user_id)
        references users(id)
        on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("time", "content", "user_id") VALUES
('2023-03-20 12:22:00', 'This is my first peep!', '1'),
('2023-04-01 10:19:00', 'Hello Chitter.', '2');
