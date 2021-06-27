CREATE TABLE Peeps (
   id SERIAL PRIMARY KEY,
   peep VARCHAR(140),
   created_on TIMESTAMP,
   user_id INT,
   FOREIGN KEY(user_id) REFERENCES users(id)
);