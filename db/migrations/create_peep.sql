CREATE TABLE peep (
    id serial primary key,
    message varchar(200),
    time_posted timestamp DEFAULT (current_timestamp at time zone 'GMT'),
    posted_by integer
);

alter table peep add foreign key (posted_by) references maker(id);
