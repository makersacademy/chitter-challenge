CREATE TABLE peeps (
    id serial primary key,
    message varchar(120),
    makerid int4,
    createstamp timestamp
);
