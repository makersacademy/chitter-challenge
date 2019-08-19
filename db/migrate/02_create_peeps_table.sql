create table peeps (id serial primary KEY
,reply_to_peep_id integer references peeps(id)
,user_id integer references users (id)
,content varchar(255)
,html_content varchar(1000)
,created_at timestamp without time zone default (now() at time zone 'utc')
)