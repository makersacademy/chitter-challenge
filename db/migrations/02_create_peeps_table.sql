CREATE TABLE peeps(id SERIAL PRIMARY KEY, user_id INT, peep VARCHAR(60), created DATE, FOREIGN KEY (user_id) REFERENCES users(id) );
