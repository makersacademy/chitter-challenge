CREATE TABLE peeps(
                   id SERIAL PRIMARY KEY,
                   text VARCHAR(500),
                   user_id INTEGER REFERENCES users (id)
                   );
