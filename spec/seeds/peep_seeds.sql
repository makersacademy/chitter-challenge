CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    creation_date date,
    user_id int,
);