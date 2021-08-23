CREATE TABLE comments(id SERIAL PRIMARY KEY, comment VARCHAR(200), peep integer REFERENCES peeps(id), maker integer REFERENCES users(id));
