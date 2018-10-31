require 'pg'


#If youi havent already installed PSQL
#brew install postgresql
#ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
#launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

#First you must execute these commands to create the database using psql
#pqsl postgres
#CREATE DATABASE "MasterDatabase";
#\q


#The following creates the tables in the database with the correct foreign keys. It also adds a test user :)

db = PG.connect(dbname: 'MasterDatabase')
db.exec("CREATE TABLE Users(UserID SERIAL PRIMARY KEY, UserName VARCHAR(26), UserHandle VARCHAR(16), UserEmail VARCHAR(36), UserPass VARCHAR(26) )")
db.exec("CREATE TABLE Peeps(PeepID SERIAL PRIMARY KEY, PeeperID int, PeepContent VARCHAR(256), datetime timestamp, FOREIGN KEY (PeeperID) REFERENCES Users(UserID))")
db.exec("CREATE TABLE SubPeeps(MainPeepID int, PeeperID int, PeepContent VARCHAR(256), datetime timestamp, FOREIGN KEY (PeeperID) REFERENCES Users(UserID), FOREIGN KEY (MainPeepID) REFERENCES Peeps(PeepID))")
db.exec("INSERT INTO Users (UserName, UserHandle, UserEmail, UserPass) VALUES('Liam Coombs', 'God', 'FAKEEMAIL@hotmail.co.uk', 'pass')")
db.exec("INSERT INTO Peeps (PeeperID, PeepContent, datetime) VALUES((SELECT UserID from Users WHERE UserHandle='God'), 'My first Peep!', NOW())")