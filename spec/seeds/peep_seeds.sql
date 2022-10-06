CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    content text,
    creation_date date,
    
    user_id int,
    constraint fk_user foreign key (user_id)
    references users(id)
    on delete cascade
);

