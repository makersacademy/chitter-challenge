CREATE TABLE Peeps (peep_id SERIAL PRIMARY KEY, chit_user_id INT NOT NULL, content TEXT NOT NULL,
timestamp TIMESTAMP NOT NULL, FOREIGN KEY (chit_user_id) REFERENCES Chit_User(chit_user_id));


