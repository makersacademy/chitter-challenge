CREATE TABLE tags(id SERIAL PRIMARY KEY, peep_id INT, user_id INT, FOREIGN KEY(peep_id) REFERENCES peeps(id), FOREIGN KEY(user_id) REFERENCES users(id));
