require_relative 'lib/database_connection'

DatabaseConnection.connect('chitter')

CREATE TABLE peeps (
id SERIAL PRIMARY KEY,
peep text,
date timestamp,
username_id int,
constraint fk_username foreign key(username_id)
references users(id)
);