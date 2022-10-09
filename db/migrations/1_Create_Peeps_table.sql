CREATE TABLE peeps (
                       id SERIAL PRIMARY KEY,
                       message VARCHAR(160),
                       username VARCHAR(120),
                       fullname text(120),
                       user_id int,
                       constraint fk_user foreign key(user_id)
                           references users(id)
                           on delete cascade
);