create table peeps
  (id serial primary KEY
  ,user_id integer references users (id)
  ,content varchar(255)
  ,html_content varchar(1000)
  ,created_at timestamp without time zone default (now() at time zone 'utc'))