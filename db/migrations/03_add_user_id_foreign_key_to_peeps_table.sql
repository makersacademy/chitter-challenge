alter table peeps
add column user_id integer REFERENCES peeps (id)