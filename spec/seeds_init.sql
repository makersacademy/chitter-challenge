    CREATE TABLE users (
        id SERIAL PRIMARY KEY,
        user_name TEXT,
        user_email TEXT
    );
    
    CREATE TABLE peeps (
        id SERIAL,
        peep_content TEXT,
        peep_post_date TIMESTAMP,
        user_id INT,
        constraint fk_user foreign key(user_id) references users(id) on delete cascade
    );