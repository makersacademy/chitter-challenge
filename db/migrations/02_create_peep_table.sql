CREATE TABLE Peeps (peep_id INT NOT NULL, chit_user_id INT NOT NULL, content TEXT NOT NULL,
timestamp TIMESTAMP NOT NULL, PRIMARY KEY (peep_id), FOREIGN KEY (chit_user_id) REFERENCES Chit_User(chit_user_id));


