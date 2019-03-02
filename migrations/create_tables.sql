create table peeps (
    id serial primary key,
    message varchar(120),
    makerid int4,
    createstamp timestamp
);
create table makers
(id serial primary key,
name varchar(140),
username varchar(60),
email varchar(140),
password varchar(140)
);
