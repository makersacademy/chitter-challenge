DROP TABLE IF EXISTS peeps;

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    peep_time timestamp,
    user_id int,
    constraint fk_user foreign key(user_id)
    references users(id)
    on delete cascade
);

TRUNCATE TABLE peeps RESTART IDENTITY;

INSERT INTO peeps ("content", "peep_time", "user_id") VALUES
('Hello', '2022-09-15 11:41:22', 1),
('Hi', '2022-09-14 10:32:02', 1),
('Hola', '2022-08-20 18:15:48', 1),
('Bonjour', '2022-09-15 10:11:54', 2),
('Ciao', '2022-09-15 08:28:30', 2),
('Guten Tag', '2022-09-12 01:41:22', 2),
('Ni Hao', '2022-09-11 11:41:22', 2),
('Konnichiwa', '2022-09-15 11:44:22', 3),
('Yasou', '2022-09-15 09:14:22', 3),
('Shalom', '2022-09-15 11:37:22', 3);
