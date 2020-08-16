CREATE TABLE feed (id SERIAL PRIMARY KEY, 
                   user_id INTEGER, 
                   peep_id INTEGER,
                   FOREIGN KEY (user_id) REFERENCES users(id),
                   FOREIGN KEY (peep_id) REFERENCES peeps(id));
