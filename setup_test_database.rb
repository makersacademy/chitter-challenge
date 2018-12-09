require_relative "./database_connection.rb"

def clear_test_database
  DatabaseConnection.setup('chitter_test')
  DatabaseConnection.query('DROP TABLE Peeps')
  DatabaseConnection.query('DROP TABLE Users')
  DatabaseConnection.query('CREATE TABLE Users (UserName VARCHAR(10) UNIQUE PRIMARY KEY, Password VARCHAR)')
  DatabaseConnection.query('CREATE TABLE Peeps (Peep_ID SERIAL PRIMARY KEY, Body VARCHAR(30) NOT NULL CHECK (length(Body)>0), Time_posted timestamp not null default now(), UserName VARCHAR(10), FOREIGN KEY (UserName) REFERENCES Users (UserName))')
end

def insert_data
  enc_password = BCrypt::Password.create("password")
  DatabaseConnection.query("INSERT INTO Users (username, password) VALUES('test', '#{enc_password}')")
  DatabaseConnection.query("INSERT INTO Users (username, password) VALUES('real', '#{enc_password}')")
  DatabaseConnection.query("INSERT INTO Peeps (body, username) VALUES('hello test', 'test')")
  DatabaseConnection.query("INSERT INTO Peeps (body, username) VALUES('goodbye test', 'test')")
  DatabaseConnection.query("INSERT INTO Peeps (body, username) VALUES('hello real', 'real')")
  DatabaseConnection.query("INSERT INTO Peeps (body, username) VALUES('goodbye real', 'real')")
end
