CREATE TABLE maker (
    id serial primary key,
    name varchar(50),
    user_name varchar(50) unique,
    email varchar(100) unique,
    password varchar(20) not null
);
