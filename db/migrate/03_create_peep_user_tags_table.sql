create table
peep_user_tags
(id serial primary key,
peep_id integer references peeps (id),
user_id integer references users (id))