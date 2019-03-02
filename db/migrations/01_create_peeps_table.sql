CREATE TABLE peeps (
	id SERIAL PRIMARY KEY, 
	text VARCHAR(255),
	created_at TIMESTAMP default now(),
	user_id integer REFERENCES users (id) not null
);