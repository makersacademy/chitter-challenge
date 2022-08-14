CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name text,
    email_address text,
    password text,
    username text
);

INSERT INTO users ("name", "email_address", "password", "username") VALUES
('Sophie', 'sl@aol.com', 'abc123', 'SL'),
('Mabon', 'mg@aol.com', 'def456', 'MG');

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    date_time timestamp,
    user_id int,
    constraint fk_user foreign key(user_id)
      references users(id)
      on delete cascade
);

INSERT INTO peeps ("content", "date_time", "user_id") VALUES
('Hello', '2022-06-08 12:00:00', 1),
('It is sunny today', '2022-08-03 11:00:00', 1),
('What is everyone doing today?', '2022-07-17 13:00:00', 2);
