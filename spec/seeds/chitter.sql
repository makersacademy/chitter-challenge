 
DROP TABLE IF EXISTS users, peeps;

CREATE TABLE "users" (
    id SERIAL PRIMARY KEY,
    name text, 
    username text,
    email_address text,
    password_hash text
);

INSERT INTO users (name, username, email_address, password_hash) VALUES
('Admin', 'adminusername' , 'admin@email.com', 'pwd123'); 

CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    peep_content text,
    time_of_peep timestamp,
    user_id int,
    constraint fk_user foreign key(user_id)
        references users(id)
        on delete cascade
);
