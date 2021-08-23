CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(200), maker integer REFERENCES users(id) );
