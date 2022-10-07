CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message text,
    tag text,
    time timestamp,
    user_id int4
);
