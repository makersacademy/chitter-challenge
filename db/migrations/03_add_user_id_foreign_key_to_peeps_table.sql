alter table peeps
add column user_id integer REFERENCES users (id) not null